.MODEL SMALL ;���@�s��^��j�p�g���r��A�бN��j�g�ܤp�g�A�p�g�ܤj�g�A�S��Ÿ�����
.STACK 100H
.DATA
TERM DB 'Hello ! My Name is um  Xd >!@#%^&***#@!~$'
TERM_L EQU $-TERM	;TERM����
.CODE
mov ax,@data
mov ds,ax
mov es,ax	;���F�ϥ�stosb�A�]�ӥ[�Jes

mov cx,TERM_L	;�ϥ�Loop�e���ƦnCX

AOBReplace:

lea si,TERM	;�o��O�@�ӧ�CX���ন0�}�l������ T_T
add si,TERM_L
sub si,cx
lods TERM;	;���o���Φr��(�s��al�Ȧs��)

ConvertSM:
cmp al,'A'	;�P�_A-Z
jl ConvertBG
cmp al,'Z'
jg ConvertBG
add al,20h	;�ন�p�g
lea di,TERM
add di,TERM_L
sub di,cx
stosb TERM	;�s�^�h�ثe�r������m
jmp ContinueLoop

ConvertBG:	
cmp al,'a'	;�P�_a-z
jl ContinueLoop
cmp al,'z'
jg ContinueLoop
sub al,20h	;�ন�j�g
lea di,TERM	
add di,TERM_L
sub di,cx
stosb TERM	;�s�^�h�ثe�r������m

ContinueLoop:

loop AOBReplace

SHOW:
mov dx,offset TERM	;Show�X����
mov ah,9
int 21h

DOS:
mov ah,4ch
int 21h



END