;����ӼƦr�HNUM[0]�BNUM[1]�}�C�覡�s�b�O���餤�A
;�խp���[�B��B���A�M��N��u�M�v�B�u�t�v�B
;�u�n�v�B�u�ӡv�B�u�l�ơv���O�s�^NUM[2]�BNUM[3]...�C
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




