; 2183310802
assume cs:code,ds:data
data segment
    ID  db  31h,08h,02h
    hh db ?
    mm db ?
    se db ?
    shh db 2 dup(?)
    smm db 2 dup(?)
    sss db 2 dup(?)
    CRLF   DB  0AH, 0DH,'$'

data ends
WRITE MACRO FROM,TO
    mov cx,4
    mov ah,FROM
    mov al,FROM
    shr ah,cl
    and al,1111b
    or ax,0011000000110000b
    mov TO,ah
    mov 1[TO],al
    mov dl,ah
    mov ah,02h
    int 21H
    mov dl,1[TO]
    int 21H
ENDM
code segment
main proc far
start:
    mov ax,data
    mov ds,ax
    xor cx,cx
    xor dx,dx
    mov ah,01H
    int 1AH
    call minipro
    mov ah,00H
    int 1AH

    ;获取秒数
    mov ax,dx
    mov dx,cx
    mov bx,18
    div bx
    ;获取时分秒
    mov bx,60
    mov dx,0
    div bl
    mov se,ah
    mov ah,0
    div bl
    mov mm,ah
    mov ah,0
    div bl
    mov hh,ah

    WRITE hh,shh
    mov dl,':'
    int 21h
    WRITE mm,smm
    mov dl,':'
    int 21h
    WRITE se,sss
    ;另取一行
    LEA DX, CRLF
    MOV AH, 09H
    INT 21H

    mov ax,4c00h
    int 21h
main endp

minipro proc
    ;输入字符
    mov ah,07H
    int 21h
    ret
minipro endp
code ends

end main