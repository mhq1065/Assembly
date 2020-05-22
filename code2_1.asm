; 2183310802
; 0*2 1*2 2*2 3*2 8*2
assume cs:codesg,ds:data
data segment
    M dw 10,11,12,13,-18, 20,21,22,23,28, 30,31,32,33,38, 80,-81
    n equ ($-M)/2
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
    ;register init
    mov cx,n
    mov ax,M[bx]

l:  add bx,2
    mov dx,M[bx]
    call ab
    cmp ax,dx
    ja s
    mov ax,dx
    mov si,bx
s:  loop l

    mov ax,M[si]
    mov M[bx],ax
    add bx,2
    mov [bx],si

    mov ax,4c00H
	int 21h

;abs((dx))
;对(dx)求绝对值
ab: test dx,8000H
    jz endabs
    neg dx
endabs:
    ret
codesg ends
end start