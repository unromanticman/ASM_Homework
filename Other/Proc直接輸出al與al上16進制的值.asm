;Proc直接輸出al與al上16進制的值
.MODEL SMALL
.DATA
TEMP dw 0
.STACK 100H
.CODE
	mov ax,@data
	mov ds,ax
	MOV AX, 1234H														
 	ADD AX, 5678H		 										
 	XCHG AL, AH
	mov  TEMP,ax
	push ax											
 	CALL prHex												
 ;換行
	mov	dl,0aH
	mov	ah,2
	int	21H
	mov	dl,0dH
	mov	ah,2
	int	21H

	mov  ax,TEMP
	XCHG AL, AH		 ; AX = 68ACH												
	push ax	
	CALL prHex	



DOS:
	mov ah,4ch
	int 21h


prHex PROC 
	push bp
	mov bp,sp
	mov ax,[bp+4]
	mov ah,0
	mov dl,10H
	div dl

	push ax

	.if (Al>=0AH && Al<=0FH)
		;字母
		add ax,3737H
		mov dl,al
		mov ah,2
		int 21h
	.else
		;數字
		add ax,3030H
		mov dl,al
		mov ah,2
		int 21h
	.endif
	
	pop ax
	
	.if (AH>=0AH && AH<=0FH)
		;字母
		add ax,3737H
		mov dl,ah
		mov ah,2
		int 21h
	.else
		;數字
		add ax,3030H
		mov dl,ah
		mov ah,2
		int 21h
	.endif

	pop bp
	ret 2	
prHex ENDP

end