assume cs:code,ds:data
;2183310802
data segment
    ID db 31h,08h,02h
    array dw 76,69,84,90,73,88,99,63,100,80
    l equ ($-array)/2
    S6 dw 0
    S7 dw 0
    S8 dw 0
    S9 dw 0
    S10 dw 0
data ends
code segment
main proc far
start:
    mov ax, data
    mov ds, ax
    call sub1
    ret
main endp

sub1 proc near
    mov cx, l
    mov si, 0
next:
    mov ax, array[si]
    mov bx, 10
    div bl
    mov bl, al
    mov bh,0
    sub bx, 6
    sal bx, 1
    inc S6[bx]
    add si,2
    loop next
    ret
sub1 endp

code ends
end start