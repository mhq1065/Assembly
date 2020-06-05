; still have some problems
assume cs:code,ds:data,ss:stack

TRANSTR MACRO DST,SRC
    local EXIT,L
    push ax
    push dx
    push si
    push dx
    mov ax,DST
    mov bx,SRC
    mov si,0
L:
    mov dl,[bx][si]
    push bx
    mov bx,ax
    mov [bx][si],dl
    pop bx
    cmp dl,04H
    je EXIT
    inc si
    jmp L
EXIT:
    push dx
    push si
    push dx
    push ax
ENDM

data segment
    A db 'abcdefg',04H
    B db 10 dup(?)
data ends
stack segment
    dw 10 dup(0)
stack ends
code segment
start:
    mov ax,data
    mov ds,ax
    mov ax,offset B
    mov bx,offset A

    TRANSTR ax,bx

    mov ax,4c00h
    int 21
code ends
end start