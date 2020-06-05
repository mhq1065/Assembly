; 2183310802
assume cs:code,ds:data,ss:stack
SAVE MACRO
    local AA,BB
    mov dx,bx
    and dx,1111b
    cmp dx,9
    jna AA
    add dx,55
    jmp BB
AA: 
    or dl,30h
BB:
    push dx
    shr bx,cl
ENDM
data segment
    ID  db  31h,08h,02h
    NUM dw 0
    data ends
stack segment
    dw 80 dup(0)
    stack ends
code segment
main proc
    mov ax,data
    mov ds,ax
    mov ax,stack
    mov ss,ax
    mov sp,80h

    mov al,1CH
    mov ah,35H
    int 21H
    mov ax,es
    push ax
    push bx

    push ds
    mov ax,seg COUNT
    mov ds,ax
    mov dx,offset COUNT
    mov ax,251Ch
    int 21h
    pop ds

    mov ah,07h
j:
    int 21h
    cmp al,'Q'
    jne j

    call DISPLAY

    pop dx
    pop ax
    mov ds,ax
    mov ax,251CH
    int 21H


    mov ax,4c00h
    int 21h

DISPLAY:
    mov bx,NUM
    mov cx,4

    SAVE
    SAVE
    SAVE
    SAVE

I=0
    REPT 4
    pop dx
    mov ah,02h
    int 21h
    ENDM

    mov dl,'h'
    int 21h
    ret
main endp
COUNT proc near
    inc NUM
    iret
COUNT endp
code ends
end main