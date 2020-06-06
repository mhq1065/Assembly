assume cs:code,ds:data
data segment
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
start:
    mov ax,data
    mov ds,ax
    mov ah,02H
    int 1AH
    mov hh,ch
    mov mm,cl
    mov se,dh
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
code ends
end start