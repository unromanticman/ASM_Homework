;輸入兩字密碼，且輸入時呈現 ** 隱藏輸入的字
.MODEL SMALL
.STACK 100H
.DATA
pwd db 2 dup(?)
.CODE

mov ax,@data
mov ds,ax
mov es,ax
xor si,si
mov cx,0

.while(cx<2)

InputPwd:

mov ah,8
int 21h
mov pwd[si],al

mov dl,'*'
mov ah,02
int 21h

inc si
inc cx
.endw

DOS:

mov ah,4ch
int 21h

end