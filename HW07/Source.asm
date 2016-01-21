;由鍵盤輸入5*5+8/2-7，然後利用巨集(HW6)或副程式(HW7);設計加減乘除，經計算後，將結果輸出到螢幕。請加上提示訊息。
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
	lea dx,msg1	;請求輸入自串
	mov ah,9
	int 21h
;輸入字串
   mov ah,0
   MOV   AH, 01H       ;鍵入一個字元至AL
   INT   21H
   sub al,30H
   push ax
  
   mov ah,0
   MOV   AH, 01H       ;鍵入一個字元至AL
   INT   21H
  
   mov ah,0
   MOV   AH, 01H       ;鍵入一個字元至AL
   INT   21H
   sub al,30H
   push ax
  
   mov ah,0
   MOV   AH, 01H       ;鍵入一個字元至AL
   INT   21H

   mov ah,0
   MOV   AH, 01H       ;鍵入一個字元至AL
   INT   21H
   sub al,30H
   push ax
  
   mov ah,0
   MOV   AH, 01H       ;鍵入一個字元至AL
   INT   21H

   mov ah,0
   MOV   AH, 01H       ;鍵入一個字元至AL
   INT   21H
   sub al,30H
   push ax
   
   mov ah,0
   MOV   AH, 01H       ;鍵入一個字元至AL
   INT   21H

   mov ah,0
   MOV   AH, 01H       ;鍵入一個字元至AL
   INT   21H
   sub al,30H
   push ax



    call CAL


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
CAL PROC
	push bp ;保護bp
 	mov bp,sp ;以bp偏移來取得堆棧參數
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
	
	pop bp ;還原bp
	ret 10
	CAL ENDP
END


