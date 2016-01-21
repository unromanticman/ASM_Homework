.MODEL SMALL
.DATA
SUMT db 0
SUMF db 0
.STACK 100H
.CODE

mov ax,@data
mov ds,ax

mov cx,1
.REPEAT
	
	
CHECKTHREE:
	mov ax,cx	
	mov dl,3
	div dl
	cmp ah,0
	jnz  CHECKFOUR
	inc SUMT
CHECKFOUR:
	mov ax,cx	
	mov dl,4
	div dl
	cmp ah,0
	jnz  CONTINUELOOP
	inc SUMF		
CONTINUELOOP:
	inc cx
.until cx>100


mov al,SUMF
sub SUMT,al

DOS:
mov ah,4ch
int 21h

END