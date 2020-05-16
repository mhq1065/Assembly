;p187
assume cs:codesg
; data segment
; 	db 11 dup(1)
; 	db 0
; 	db 10 dup(1)
; data ends

; stack segment
; stack ends

codesg segment
; start:
	; mov ax,data;dataseg init
	; mov ds,ax
	; mov ax,stack;stackseg init
	; mov ss,ax
	; mov sp,16
	; mov bx,0;other init
	mov ax,4c00H
	int 21h
start:
	mov ax,0
s:	nop
	nop

	mov di,offset s
	mov si,offset s2
	mov ax,cs:[si]
	mov cs:[di],ax

s0:	jmp short s

s1:	mov ax,0
	int 21h
	mov ax,0

s2:	jmp short s1
	nop

codesg ends
end start