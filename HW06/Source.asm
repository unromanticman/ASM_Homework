

;����L��J5*5+8/2-7�A�M��Q�Υ���(HW6)�ΰƵ{��(HW7);�]�p�[����A�g�p���A�N���G��X��ù��C�Х[�W���ܰT���C
.MODEL SMALL

.STACK 100H
.DATA
sum db 0
msg1 db "ENTER: $"
msg2 db "ANSWER(HEX): $"
term db 5 dup(?)

@CAL MACRO A,B,D,E,F
 	mov ax,0
	mov bl,A ;5
	mov al,B ;5
	mul bl
	mov sum,al

	mov ax,0
	mov al,D;8
	mov dl,E;2
	div dl
	add sum,al

	mov al,F;7
	sub sum,al
	
ENDM

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
   mov term [0],al
  
   mov ah,0
   MOV   AH, 01H       ;��J�@�Ӧr����AL
   INT   21H
  
   mov ah,0
   MOV   AH, 01H       ;��J�@�Ӧr����AL
   INT   21H
   sub al,30H
   mov term [1],al
  
   mov ah,0
   MOV   AH, 01H       ;��J�@�Ӧr����AL
   INT   21H

   mov ah,0
   MOV   AH, 01H       ;��J�@�Ӧr����AL
   INT   21H
   sub al,30H
   mov term [2],al
  
   mov ah,0
   MOV   AH, 01H       ;��J�@�Ӧr����AL
   INT   21H

   mov ah,0
   MOV   AH, 01H       ;��J�@�Ӧr����AL
   INT   21H
   sub al,30H
   mov term [3],al
   
   mov ah,0
   MOV   AH, 01H       ;��J�@�Ӧr����AL
   INT   21H

   mov ah,0
   MOV   AH, 01H       ;��J�@�Ӧr����AL
   INT   21H
   sub al,30H
   mov term [4],al



    @CAL term[0],term[1],term[2],term[3],term[4]


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

END
