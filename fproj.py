import sys
import random

# generate random array of arrays
def randox():
    x = []
    for i in range(0,8):
        while True:
            c = random.randint(1,8)
            #check for duplication
            dupl = False
            for d in x:
                if d == c:
                    dupl = True
                    break
            #endfor
            if not dupl:
                break
        #endwhile
        x.append(c)
    #endfor
    return x
#end randox



def add2line(line,size,level):
    if level == 1:
        if size == 8:
            line = line+"..+------+"
        elif size == 7:
            line = line+"..+-----+."
        elif size == 6:
            line = line+"...+----+."
        elif size == 5:
            line = line+"...+---+.."
        elif size == 4:
            line = line+"....+--+.."
        elif size == 3:
            line = line+"....+-+..."
        elif size == 2:
            line = line+".....++..."
        else:
            line = line+".....+...."
    elif level > 1:
        if size < level:
            line = line+"          "
        elif size == level:
            if size == 8:
                line = line+"  +------+"
            elif size == 7:
                line = line+"  +-----+ "
            elif size == 6:
                line = line+"   +----+ "
            elif size == 5:
                line = line+"   +---+  "
            elif size == 4:
                line = line+"    +--+  "
            elif size == 3:
                line = line+"    +-+   "
            elif size == 2:
                line = line+"     ++   "
            else:
                line = line+"      +   "
        else:
            if size == 8:
                line = line+"  +      +"
            elif size == 7:
                line = line+"  +     + "
            elif size == 6:
                line = line+"   +    + "
            elif size == 5:
                line = line+"   +   +  "
            elif size == 4:
                line = line+"    +  +  "
            elif size == 3:
                line = line+"    + +   "
            elif size == 2:
                line = line+"     ++   "
            else:
                line = line+"      +   "
    else:
        # so level == 0
        line = line+"     "+str(size)+"    "
    return line
#end add2line

def create_line(x,level):
    line=""
    for i in range(0,8):
        line = add2line(line,x[i],level)
    #endfor
    return line
#end create_line
    

def display(x):
    for i in range(9,0,-1):
        line = create_line(x,i-1)
        print(line)
    #endfor
#end display

def main():
    x = randox()
    while True:
        display(x)
        print("if you want to swap, enter a,b")
        res=input("if you want to end, enter 0: ")
        if res[0] == '0':
            print("program done")
            break
        if res[0] < '1' or res[0] > '8':
            print("incorrect input, redo")
            continue
        if res[1] != ',':
            print("incorrect input, redo")
            continue
        if res[2] < '1' or res[2] > '8':
            print("incorrect input, redo")
            continue
        if res[1] == res[2]:
            print("incorrect input, redo")
            continue
        a = ord(res[0])-ord('0')
        b = ord(res[2])-ord('0')
        print("swappin box ",a," with a box ",b)
        for i in range(0,8):
            if x[i] == a:
                a1 = i
            elif x[i] == b:
                b1 = i
        x[a1],x[b1] = x[b1],x[a1]
    #endwhile
#end main

main()
    
        
    

        



