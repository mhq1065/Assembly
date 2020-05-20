; 2183310802

assume cs:codesg,ds:data,ss:stack
data segment
    A dw 21,83,31,08,02,6,7,16,9,10,11,12,13,14,15
    B dw 28,33,38,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
    C dw 15 dup(?)
    ;result
    D dw 0
    ;number
data ends
stack segment
    dw 2 dup(0) 
stack ends
codesg segment
start:
    ;dataseg init
	mov ax,data
	mov ds,ax
    mov ax,stack
    mov ss,ax
    mov sp,5
    xor bx,bx
    xor bp,bp

    mov cx,15

l1: mov bx,cx;loop1
    add bx,bx
    sub bx,2
    mov ax,A[bx]
    push cx

    mov cx,20
l2: mov bx,cx;loop2
    add bx,bx
    sub bx,2
    cmp ax,B[bx]
    jne s1

    mov C[bp],ax
    add bp,2;store the same element
    
    mov bx,D
    inc bx
    mov D,bx

s1: loop l2

    pop cx
    loop l1

    mov ah,4cH
	int 21h
codesg ends
end start