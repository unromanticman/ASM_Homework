;����ӼƦr�HNUM[0]�BNUM[1]�}�C�覡�s�b�O���餤�A�խp���[�B��B���A�M��N
;��u�M�v�B�u�t�v�B�u�n�v�B�u�ӡv�B�u�l�ơv���O�s�^NUM[2]�BNUM[3]...�C
;�Hunpacked BCD����
.MODEL SMALL
.STACK 100H
.DATA
NUM DW 8,5,0,0,0,0,0
.CODE
mov ax,@data
mov ds,ax
mov ax,NUM[0]
add ax,NUM[2]
aaa
mov NUM[4],ax;

mov ax,NUM[0]
sub ax,NUM[2]
aas
mov NUM[6],ax;

mov BX,NUM[0]
mov AX,NUM[2]
MUL BL
aam
mov NUM[8],ax;

mov ax,NUM[0]
mov cx,NUM[2]
AAD
DIV CL
push ax
mov ah,0
mov NUM[10],ax
pop ax
mov al,ah
mov ah,0
mov NUM[12],ax


BackDos:
mov ah,4ch
int 21h
end

