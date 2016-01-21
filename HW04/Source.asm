;有兩個數字以NUM[0]、NUM[1]陣列方式存在記憶體中，試計算其加、減乘、除，然後將
;其「和」、「差」、「積」、「商」、「餘數」分別存回NUM[2]、NUM[3]...。
;以unpacked BCD完成
.MODEL SMALL
.STACK 100H
.DATA
NUM DW 8,5,0,0,0,0,0
.CODE
mov ax,@data
mov ds,ax
mov ax,NUM[0]
add ax,NUM[2]
aaa
mov NUM[4],ax;

mov ax,NUM[0]
sub ax,NUM[2]
aas
mov NUM[6],ax;

mov BX,NUM[0]
mov AX,NUM[2]
MUL BL
aam
mov NUM[8],ax;

mov ax,NUM[0]
mov cx,NUM[2]
AAD
DIV CL
push ax
mov ah,0
mov NUM[10],ax
pop ax
mov al,ah
mov ah,0
mov NUM[12],ax


BackDos:
mov ah,4ch
int 21h
end

