; 2183310802
assume cs:codesg,ds:data
data segment
    M dw 21,83,31,08,02,1,2,3,4,5,6,7,8,9,10,11,12
    ;5+12=17
    dd 0
    ;result
    dd 0
    ;address
data ends
codesg segment
start:
    ;dataseg init
	mov ax,data
	mov ds,ax
    xor bx,bx

    mov cx,17
    mov ax,M[bx]

l:  add bx,2
    cmp ax,M[bx]
    ja s
    mov ax,M[bx]
    mov si,bx
s:  loop l

    mov [bx],ax
    add bx,2
    mov [bx],si

    mov ax,4c00H
	int 21h


codesg ends
end start