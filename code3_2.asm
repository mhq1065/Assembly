;2183310802
.model small 
.stack 80h
.data
    ID db 31h,08h,02h
    NUM db 5
    RESULT dw ?
.code 
main proc far 
start: 
    mov ax,@data
    mov ds,ax

    xor ax,ax 
    push ds 
    push ax 
    mov al,[NUM]
    push ax 
    call FIB
    pop ax
    mov [RESULT],ax
    mov ax,4c00h
    int 21h
    ret
main endp 
FIB proc near
    push ax
    mov bp,sp
    mov ax,[bp+4]
    cmp ax,2
    ja L1
    mov ax,1
    mov [bp+4],ax
    pop ax
    ret
L1: 
    dec ax
    push ax
    call FIB
    dec ax
    push ax
    call FIB

    pop ax
    pop dx
    add ax,dx
    mov bp,sp
    mov [bp+4],ax
    pop ax
    ret
FIB endp 
end start 