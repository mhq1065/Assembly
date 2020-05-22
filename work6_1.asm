assume cs:code,ss:stack
stack segment
    dw 5 dup(0)
stack ends
code segment
start:    
    ;register init
    mov ax,1234H
    mov sp,10

    mov cx,4
    
s:  mov bp,cx;store cx
    mov cx,4
    ror ax,cl
    mov dx,ax
    and dx,1111b;get lower 4 bit
    push dx;store by stack
    mov cx,bp;free cx
    loop s

    ;pop the ans in order
    pop dx
    pop ax
    pop bx
    pop cx

    mov   ax, 4c00h
    int   21h
code ends
end start 