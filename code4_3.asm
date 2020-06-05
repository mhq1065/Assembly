; 2183310802
assume cs:code,ds:data
data segment
    ID  db  '2183310802'
    pwd db 7,5,9,1,3,6,8,0,2,4
    INPUT db 11
            db ?
            db 11 dup(0)
    BUFFER  db 10 dup (?)
data ends
code segment
start:
    mov ax,data
    mov ds,ax

    LEA DX,INPUT
    mov ah,10
    int 21h

    mov si,0
    mov cx,10
s:
    LEA bx,pwd
    mov al,INPUT[si+2]
    and al,1111b
    XLAT
    mov BUFFER[si],al
    inc si
    loop s

    mov ax,4c00h
    int 21h
code ends
end start
