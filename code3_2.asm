;2183310802
.model small 
.stack 080h
.code 
main proc far 
start: 
    xor ax,ax 
    push ds 
    push ax 
    mov ax,4 
    push ax 
    call FIB 
    ret 
main endp 
FIB proc near 
    push bp 
    mov bp,sp 
    add sp,-4 
    mov cx,[bp+4] 
    cmp cx,2 
    ja recursive 
    mov ax,1 
    add sp,4 
    pop bp 
    ret 2 
recursive: 
    mov word ptr[bp-4],cx 
    dec cx 
    push cx 
    call FIB 
    mov word ptr[bp-2],ax 
    dec cx 
    push cx 
    call FIB 
    add ax,word ptr[bp-2] 
    mov cx,word ptr[bp-4] 
    add sp,4 
    pop bp 
    ret 2 
FIB endp 
end start 