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
	mov di,0
	mov ax,B[di]
	mov ax,4c00H
	int 21h
codesg ends
end start