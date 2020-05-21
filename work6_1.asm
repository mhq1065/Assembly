assume cs:code, ds:data
data segment
data ends

code segment
start:    
    ;register init
    mov ax,1234H
    xor bx,bx
    xor cx,cx
    xor dx,dx

    mov dl,al
    and dl,0FH
    mov bl,ah
    and bl,0FH

    mov cx,4
    mov bp,ax
    rol bp,cl
    and bp,0FH

    ror ax,cl
    and ax,0FH
    mov cx,ax
    mov ax,bp


    mov   ax, 4c00h
    int   21h
code ends
end start 