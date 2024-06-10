from fpdf import FPDF


class PDF():
    def __init__(self, name):
        self._pdf = FPDF()
        self._pdf.add_page()
        self.text(0,0,text="CS50 Shirtificate")
        self._pdf.ln(h=20)
        self._pdf.image("shirtificate.png",w=self._pdf.epw)
        self.text(-250,255,text=f'{name} took CS50')

    def text(self,heights,colour,text):
        self._pdf.set_text_color(r=int(colour))
        self._pdf.set_font("Times", size=36)
        self._pdf.cell(w=0,h=heights,txt=text, new_x="LMARGIN", new_y="NEXT",align='C')

    def out(self,shirt):
        self._pdf.output(shirt)

x = input("Name: ")
x = PDF(x)
x.out("shirtificate.pdf")

