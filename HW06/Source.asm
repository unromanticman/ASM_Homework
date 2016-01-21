

;由鍵盤輸入5*5+8/2-7，然後利用巨集(HW6)或副程式(HW7);設計加減乘除，經計算後，將結果輸出到螢幕。請加上提示訊息。
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
	lea dx,msg1	;請求輸入自串
	mov ah,9
	int 21h
;輸入字串
   mov ah,0
   MOV   AH, 01H       ;鍵入一個字元至AL
   INT   21H
   sub al,30H
   mov term [0],al
  
   mov ah,0
   MOV   AH, 01H       ;鍵入一個字元至AL
   INT   21H
  
   mov ah,0
   MOV   AH, 01H       ;鍵入一個字元至AL
   INT   21H
   sub al,30H
   mov term [1],al
  
   mov ah,0
   MOV   AH, 01H       ;鍵入一個字元至AL
   INT   21H

   mov ah,0
   MOV   AH, 01H       ;鍵入一個字元至AL
   INT   21H
   sub al,30H
   mov term [2],al
  
   mov ah,0
   MOV   AH, 01H       ;鍵入一個字元至AL
   INT   21H

   mov ah,0
   MOV   AH, 01H       ;鍵入一個字元至AL
   INT   21H
   sub al,30H
   mov term [3],al
   
   mov ah,0
   MOV   AH, 01H       ;鍵入一個字元至AL
   INT   21H

   mov ah,0
   MOV   AH, 01H       ;鍵入一個字元至AL
   INT   21H
   sub al,30H
   mov term [4],al



    @CAL term[0],term[1],term[2],term[3],term[4]


;換行
	mov	dl,0aH
	mov	ah,2
	int	21H
	mov	dl,0dH
	mov	ah,2
	int	21H
;印出答案
	lea dx,msg2	
	mov ah,9
	int 21h

;輸出	
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
