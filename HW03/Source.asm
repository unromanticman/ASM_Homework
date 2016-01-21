.MODEL SMALL ;有一連串英文大小寫的字串，請將其大寫變小寫，小寫變大寫，特殊符號不變
.STACK 100H
.DATA
TERM DB 'Hello ! My Name is um  Xd >!@#%^&***#@!~$'
TERM_L EQU $-TERM	;TERM長度
.CODE
mov ax,@data
mov ds,ax
mov es,ax	;為了使用stosb，因而加入es

mov cx,TERM_L	;使用Loop前先備好CX

AOBReplace:

lea si,TERM	;這邊是一個把CX反轉成0開始的概念 T_T
add si,TERM_L
sub si,cx
lods TERM;	;取得分割字元(存於al暫存器)

ConvertSM:
cmp al,'A'	;判斷A-Z
jl ConvertBG
cmp al,'Z'
jg ConvertBG
add al,20h	;轉成小寫
lea di,TERM
add di,TERM_L
sub di,cx
stosb TERM	;存回去目前字元的位置
jmp ContinueLoop

ConvertBG:	
cmp al,'a'	;判斷a-z
jl ContinueLoop
cmp al,'z'
jg ContinueLoop
sub al,20h	;轉成大寫
lea di,TERM	
add di,TERM_L
sub di,cx
stosb TERM	;存回去目前字元的位置

ContinueLoop:

loop AOBReplace

SHOW:
mov dx,offset TERM	;Show出答案
mov ah,9
int 21h

DOS:
mov ah,4ch
int 21h



END