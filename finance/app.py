import os
import string
from cs50 import SQL
from flask import Flask, flash, redirect, render_template, request, session
from flask_session import Session
from tempfile import mkdtemp
from werkzeug.security import check_password_hash, generate_password_hash
from datetime import date
from helpers import apology, login_required, lookup, usd

# Configure application
app = Flask(__name__)

# Custom filter
app.jinja_env.filters["usd"] = usd

# Configure session to use filesystem (instead of signed cookies)
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

# Configure CS50 Library to use SQLite database
db = SQL("sqlite:///finance.db")

# Make sure API key is set
if not os.environ.get("API_KEY"):
    raise RuntimeError("API_KEY not set")


@app.after_request
def after_request(response):
    """Ensure responses aren't cached"""
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Expires"] = 0
    response.headers["Pragma"] = "no-cache"
    return response


@app.route("/")
@login_required
def index():
    """Show portfolio of stocks"""
    user_id = session["user_id"]
    rows = db.execute("SELECT * FROM transactions WHERE user_id = :id GROUP BY symbol", id=session["user_id"])
    cash = db.execute("SELECT cash FROM users WHERE id = ?", user_id)
    cashh = usd(cash[0]["cash"])
    cashhh = cash[0]["cash"]
    sum = cashhh

    for row in rows:
        look = lookup(row['symbol'])
        row['name'] = look['name']
        row['price'] = look['price']
        row['total'] = row['price'] * row['shares']

        # increment sum
        sum += row['total']

        # convert price and total to usd format
        row['price'] = usd(row['price'])
        row['total'] = usd(row['total'])

    return render_template("index.html", rows=rows, cashh=cashh, sum=usd(sum))


@app.route("/buy", methods=["GET", "POST"])
@login_required
def buy():
    """Buy shares of stock"""
    if request.method == "GET":
        return render_template("buy.html")
    else:
        symbol = request.form.get("symbol")
        shares = request.form.get("shares")
        quote = lookup(symbol)
        if quote == None:
            return apology("must provide valid stock symbol", 400)
        if not shares:
            return apology("must provide number of shares", 400)
        if not shares.isdigit():
            return apology("Add valid shares", 400)
        symbol = symbol.upper()
        shares = int(shares)
        if shares <= 0:
            return apology("must provide valid shares", 400)
        purchase = quote['price'] * shares
        balance = db.execute("SELECT cash FROM users WHERE id = ?", session["user_id"])
        balance = balance[0]['cash']
        remainder = balance - purchase
        today = date.today()
        if remainder < 0:
            return apology("insufficient funds", 400)

        db.execute("INSERT INTO transactions (user_id, symbol, shares, price, date) VALUES (?, ?, ?, ?, ?)",
                   session["user_id"], quote['symbol'], shares, quote['price'], today)

        db.execute("UPDATE users SET cash = ? WHERE id = ?", remainder, session["user_id"])
        flash("Success!")
        return redirect("/")


@app.route("/history")
@login_required
def history():
    """Show history of transactions"""
    user_id = session["user_id"]
    transactions = db.execute("SELECT * FROM transactions WHERE user_id = ?", user_id)
    return render_template("history.html", transactions=transactions)


@app.route("/login", methods=["GET", "POST"])
def login():
    """Log user in"""

    # Forget any user_id
    session.clear()

    # User reached route via POST (as by submitting a form via POST)
    if request.method == "POST":

        # Ensure username was submitted
        if not request.form.get("username"):
            return apology("must provide username", 403)

        # Ensure password was submitted
        elif not request.form.get("password"):
            return apology("must provide password", 403)

        # Query database for username
        rows = db.execute("SELECT * FROM users WHERE username = ?", request.form.get("username"))

        # Ensure username exists and password is correct
        if len(rows) != 1 or not check_password_hash(rows[0]["hash"], request.form.get("password")):
            return apology("invalid username and/or password", 403)

        # Remember which user has logged in
        session["user_id"] = rows[0]["id"]

        # Redirect user to home page
        return redirect("/")

    # User reached route via GET (as by clicking a link or via redirect)
    else:
        return render_template("login.html")


@app.route("/logout")
def logout():
    """Log user out"""

    # Forget any user_id
    session.clear()

    # Redirect user to login form
    return redirect("/")


@app.route("/quote", methods=["GET", "POST"])
@login_required
def quote():
    """Get stock quote."""
    if request.method == "GET":
        return render_template("quote.html")
    else:
        stock = lookup(request.form.get("symbol"))
        if not request.form.get("symbol"):
            return apology("must provide symbol", 400)
        if stock == None:
            return apology("invalid symbol", 400)
        return render_template("quoted.html", name=stock["name"], price=stock["price"], symbol=stock["symbol"])


@app.route("/register", methods=["GET", "POST"])
def register():
    """Register user"""
    if request.method == "GET":
        return render_template("register.html")
    else:
        if not request.form.get("username"):
            return apology("must provide username", 400)
        elif not request.form.get("password"):
            return apology("must provide password", 400)
        elif not request.form.get("confirmation"):
            return apology("must provide confirmation", 400)
        elif request.form.get("password") != request.form.get("confirmation"):
            return apology("Passwords do not match", 400)
        username = request.form.get("username")
        special_characters = list(string.punctuation)
        password = request.form.get("password")
        if not any(i in password for i in special_characters):
            return apology("Password must have special characters!", 400)

        rows = db.execute("SELECT * FROM users WHERE username = ?", request.form.get("username"))
        if len(rows) != 0:
            return apology("Username already exists.", 400)
        hash = generate_password_hash(request.form.get("password"))
        db.execute("INSERT INTO users (username, hash) VALUES(?, ?)", username, hash)

        return redirect("/")


@app.route("/sell", methods=["GET", "POST"])
@login_required
def sell():
    """Sell shares of stock"""
    if request.method == "GET":
        user_id = session["user_id"]
        symbols_user = db.execute("SELECT symbol FROM transactions WHERE user_id = ?", user_id)
        return render_template("sell.html", symbols=[row["symbol"] for row in symbols_user])
    else:
        user_id = session["user_id"]
        symbol = request.form.get("symbol")
        shares = request.form.get("shares")
        quote = lookup(symbol)
        if quote == None:
            return apology("must provide valid stock symbol", 400)
        if not shares:
            return apology("must provide number of shares", 400)
        symbol = symbol.upper()
        shares = int(shares)
        if shares <= 0:
            return apology("must provide valid shares", 400)

        purchase = quote['price'] * shares
        balance = db.execute("SELECT cash FROM users WHERE id = ?", session["user_id"])
        balance = balance[0]['cash']
        remainder = balance + purchase
        today = date.today()
        user_shares = db.execute(
            "SELECT SUM(shares) AS shares FROM transactions WHERE user_id=:id AND symbol = :symbol", id=user_id, symbol=symbol)
        usersharess = user_shares[0]["shares"]

        if shares > usersharess:
            return apology("insufficient shares", 400)

        db.execute("INSERT INTO transactions (user_id, symbol, shares, price, date) VALUES (?, ?, ?, ?, ?)",
                   session["user_id"], quote['symbol'], (-1) * shares, quote['price'], today)
        db.execute("UPDATE users SET cash = ? WHERE id = ?", remainder, session["user_id"])
        flash("Success!")
        return redirect("/")