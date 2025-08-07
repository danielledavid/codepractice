class Solution:
    def romanToInt(self, s: str) -> int:
        dict ={
            "I" : 1,
            "V" : 5,
            "X" : 10,
            "L" : 50,
            "C" : 100,
            "D" : 500,
            "M" : 1000
        }
        list = []
        stop = []
        for i in range(len(s)):
            i = len(stop)
            if i >= len(s):
                break
            if i < len(s) - 1:
                if dict[s[i]] < dict[s[i + 1]]:
                    sum1 = dict[s[i + 1]] - dict[s[i]]
                    print(sum1)
                    list.append(sum1)
                    stop.append(1)
                    stop.append(1)
                    continue
                else:
                    list.append(dict[s[i]])
                    stop.append(1)
            else:
                list.append(dict[s[i]])
                stop.append(1)
        return sum(list)