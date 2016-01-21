;輸入密碼mn,再輸入一個數字，反序印出遞減數列 
.286
.MODEL SMALL
.STACK 100H
.DATA
HELLO DB 0DH,0AH,"how are you?$"
ASK DB 0AH,0DH,"Please enter a number: $"
.CODE
.startup
AGAIN:
	MOV AH,7
	INT 21H
	CMP AL,'m'
	JNE AGAIN

	MOV AH,7
	INT 21H
	CMP AL,'n'
	JNE AGAIN

	LEA DX,ASK
	MOV AH,9
	INT 21H
		
	MOV AH,1
	INT 21H
	MOV BX,0
	MOV BL,AL
	MOV CX,0
	MOV CL,BL
	SUB CL,30H

PRINT:	
	;換行
	mov	dl,0aH
	mov	ah,2
	int	21H
	mov	dl,0dH
	mov	ah,2
	int	21H
	mov ax,cx	
	mov dl,al
	inc al
	add dl,30H
	mov ah,2
	int 21h
	
	LOOP PRINT

	.exit
END
	
	
	