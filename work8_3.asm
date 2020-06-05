assume cs:code,ds:data
data segment
    BUFF1 DB 100 dup(?)
    BUFF2 DB 100 dup(?)
    data ends
code segment
start:
    mov ax,data
    mov ds,ax
    mov ax,0
    xor si,si
    xor di,di
J:  
    in al,0024H
    in ah,0038H
    mov dx,ax

    and al,10000000b
    cmp al,0
    je IN1
    out BUFF1[si],0026H
    inc si
IN1:
    and ah,10000000b
    cmp ah,0
    je IN2
    out BUFF2[di],0026H
    inc di
IN2:
    and dh,00010000b
    jnz EXIT
    and dl,00010000b
    jnz EXIT
    jmp J
EXIT:
    mov ax,4c00h
    int 21
code ends
    end start