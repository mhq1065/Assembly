assume cs:code,ds:data

data segment
    db 'welcome to masm!'
    db '        --by zzb'
    db '--A handsome boy'
data ends

code segment

start:
    mov ax,data
    mov ds,ax
    mov ax,0b800h
    mov es,ax
    mov bx,0720h
    add bx,640 ;g出来会上移四行
    mov cx,16
    mov si,0

    s:
    
    mov al,[si]    ;字符
    mov ah,10   ; 绿色（高亮）不高亮为 2
    mov word ptr es:[bx],ax

    mov al,[si+16]    ;字符
    mov ah,44       ; 绿底红色（高亮）不高亮为36
    mov word ptr es:[bx+160],ax

    mov al,[si+32]    ;字符
    mov ah,121       ; 白底蓝色（高亮）不高亮为113
    mov word ptr es:[bx+160+160],ax
    inc si
    add bx,2
    loop s

    ; mov ah,00h    ;设置显示方式
    ; mov al,03h    ;80*25 16色文本显示
    ; int 10h       
    mov ah,2
    mov bh,9
    mov dh,5
    mov dl,12
    int 10h

    mov ah,9
    mov al,'a'
    mov bl,11001010b
    mov bh,0
    mov cx,3
    int 10h

    


    mov ax,4c00h
    int 21h
code ends
end start