;撰寫Y=(A+B)*(D-E)/F，A,B,D,E,F,Y分別為記憶體的變數名稱，用一般的有號數十六進位完成。
.MODEL SMALL
.DATA
A DW	15H 
B DW	12H	
D DW	11H
E DW 	10H
F DW	9H
Y DW	0H
.CODE
mov ax,@data
mov ds,ax

mov ax,A
add ax,B
add Y,ax

mov bx,Y
mov ax,D
sub ax,E
mul bx
mov Y,ax

mov ax,Y
mov cx,F
div cx
mov Y,ax

DOS:
mov ah,4ch
int 21h

END