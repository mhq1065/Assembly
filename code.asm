assume cs:codesg,ds:data,ss:stack
data segment
	B dw 'he','ll','o','p'
	dw 12
data ends

stack segment
stack ends

codesg segment
	db 2
start:
	mov ax,data;dataseg init
	mov ds,ax
	mov ax,stack;stackseg init
	mov ss,ax
	mov sp,16
	mov bx,0;other init	
s:	mov cl,[bx]
	mov ch,0
	inc cx
	inc bx
	loop s
ok:	dec bx
	mov dx,bx
	mov ax,4c00H
	int 21h
codesg ends
end start