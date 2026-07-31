ST a,10

ST c,5

ST e,10

MOV ax,2
MOV bx,c
MUL bx
MOV t1, ax
MOV ax,a
MOV bx,t1
ADD ax, bx
MOV t2, ax
MOV ax,t2
MOV bx,12
SUB ax, bx
MOV t3, ax
ST d,t3

MOV ax,a
MOV bx,c
SUB ax, bx
MOV t1, ax
MOV ax,2
MOV bx,3
SUB ax, bx
MOV t2, ax
MOV ax,5
MOV bx,t2
MUL bx
MOV t3, ax
MOV ax,t1
MOV bx,t3
SUB ax, bx
MOV t4, ax
ST d,t4


