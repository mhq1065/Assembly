assume cs:code,ds:data
;2183310802
data segment
    X db '2183310802'
    l equ $-X
data ends
code segment
start:
    mov ax,data
    mov ds,ax

    if l GE 10
    REPT 5
    add ax,ax
    ENDM
    
    endif
    mov ax,4c00h
    int 21h

code ends
end start