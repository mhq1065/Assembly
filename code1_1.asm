; 学号2183310802
; X=0802h
; Y=3108h
; W=3310h
assume cs:codesg,ds:data
data segment
	X dw 0802h
	Y dw 3108H
	W dw 3310H
	Z dw ?
data ends
codesg segment
start:
	mov ax,data;dataseg init
	mov ds,ax

	mov ax,W
	sub ax,X
	mov bx,5
	cwd
	idiv bx
	imul Y; *Y
	mov bx,2
	mul bx; *2
	mov Z,ax

    mov ax,4c00H
	int 21h
codesg ends
end start