; 2183310802
assume cs:codesg,ds:data,ss:stack
data segment
    XH db '2183310802'
    NUMBER db 10 dup(0)
    CRLF db 0AH, 0DH,'$'
data ends

stack segment
    db 6 dup(0) 
stack ends

codesg segment
start:
    ;dataseg init
	mov ax,data
	mov ds,ax
    ;stack init
    mov ax,stack
    mov ss,ax
    mov sp,7
    ;es init
    mov ax,0b800h
    mov es,ax
    ;Register init
    xor si,si
    xor ax,ax
    mov cx,10

s:  mov al,XH[si]
    call count
    inc si
    loop s

    ;display the result
    call display

    mov ax,4c00H
	int 21h

count:
    sub ax,'0'
    mov bx,ax
    mov al,NUMBER[bx]
    inc al
    mov NUMBER[bx],al
    ret

display:
    mov cx,10
    xor bx,bx
d:  
    ;output 0-9
    mov dx,bx
    add dx,'0'
    mov ah,02H;set op code
    int 21h
    ;output space
    mov dl,20h
    int 21h

    inc bx
    loop d

    ;output \n\r
    lea DX, CRLF               
    mov AH, 09h
    int 21H

    mov cx,10
    xor bx,bx

d1: mov dx,NUMBER[bx]
    add dx,'0'
    mov ah,02H;set op code
    int 21h
    ;output space
    mov dl,20h
    int 21h

    inc bx
    loop d1
    ret

codesg ends
end start