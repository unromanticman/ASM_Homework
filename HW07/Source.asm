;����L��J5*5+8/2-7�A�M��Q�Υ���(HW6)�ΰƵ{��(HW7);�]�p�[����A�g�p���A�N���G��X��ù��C�Х[�W���ܰT���C
.MODEL SMALL
.STACK 100H
.DATA
string db 9 dup(?)
sum db 0
msg1 db "ENTER: $"
msg2 db "ANSWER(HEX): $"
.CODE
	mov ax,@data
	mov ds,ax
	lea dx,msg1	;�ШD��J�ۦ�
	mov ah,9
	int 21h
;��J�r��
   mov ah,0
   MOV   AH, 01H       ;��J�@�Ӧr����AL
   INT   21H
   sub al,30H
   push ax
  
   mov ah,0
   MOV   AH, 01H       ;��J�@�Ӧr����AL
   INT   21H
  
   mov ah,0
   MOV   AH, 01H       ;��J�@�Ӧr����AL
   INT   21H
   sub al,30H
   push ax
  
   mov ah,0
   MOV   AH, 01H       ;��J�@�Ӧr����AL
   INT   21H

   mov ah,0
   MOV   AH, 01H       ;��J�@�Ӧr����AL
   INT   21H
   sub al,30H
   push ax
  
   mov ah,0
   MOV   AH, 01H       ;��J�@�Ӧr����AL
   INT   21H

   mov ah,0
   MOV   AH, 01H       ;��J�@�Ӧr����AL
   INT   21H
   sub al,30H
   push ax
   
   mov ah,0
   MOV   AH, 01H       ;��J�@�Ӧr����AL
   INT   21H

   mov ah,0
   MOV   AH, 01H       ;��J�@�Ӧr����AL
   INT   21H
   sub al,30H
   push ax



    call CAL


;����
	mov	dl,0aH
	mov	ah,2
	int	21H
	mov	dl,0dH
	mov	ah,2
	int	21H
;�L�X����
	lea dx,msg2	
	mov ah,9
	int 21h

;��X	
	mov ah,0
	mov al,sum
	mov dl,10
	div dl
	add ax,3030H
	
	mov dl,ah
	mov ah,2
	int 21h

	mov dl,al
	mov ah,2
	int 21h

DOS:
	mov ah,4ch
	int 21h
CAL PROC
	push bp ;�O�@bp
 	mov bp,sp ;�Hbp�����Ө��o��̰Ѽ�
 	mov ax,0
	mov bl,[bp+12] ;5
	mov al,[bp+10] ;5
	mul bl
	mov sum,al

	mov ax,0
	mov al,[bp+8];8
	mov dl,[bp+6];2
	div dl
	add sum,al

	mov al,[bp+4];7
	sub sum,al
	
	pop bp ;�٭�bp
	ret 10
	CAL ENDP
END


