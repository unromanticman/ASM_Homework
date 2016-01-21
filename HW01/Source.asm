;有兩個數字以NUM[0]、NUM[1]陣列方式存在記憶體中，
;試計算其加、減乘、除，然後將其「和」、「差」、
;「積」、「商」、「餘數」分別存回NUM[2]、NUM[3]...。
.MODEL SMALL
.DATA
NUM db 6H,4H,0H,0H,0H,0H,0H
.CODE
mov ax,@data
mov ds,ax

mov al,NUM[0];ADD
add al,NUM[1]
mov NUM[2],al

mov al,NUM[0];SUB
sub al,NUM[1]
mov NUM[3],al

mov bl,NUM[0];MUL
mov al,NUM[1]
mul bl
mov NUM[4],al

mov al,NUM[0];DIV
mov ah,0
mov dl,NUM[1]
div dl
mov NUM[5],al
mov NUM[6],ah

mov ah,4ch
int 21h
end




