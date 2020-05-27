stack segment
    dw 128 dup(0)
    tos label word
stack ends
code segment 
main proc far 
    assume cs:code,ss:stack
start: 
    mov ax,stack 
    mov ss,ax 
    mov sp,offset tos
    
    push ds
    xor ax,ax
    push ax
;MAIN PART OF PROGRAM GOES HERE
    mov ax,4321h
    call htoa
    ret 
main endp 

htoa proc near 
    cmp ax,15
    jle lower 
    push ax
    push bp 
    mov bp,sp 
    mov bx,[bp+2]
    and bx,000fh 
    mov [bp+2],bx 
    pop bp 
    mov cl,4
    shr ax,cl
    call htoa 
    pop ax 
lower:
    add al,30h 
    cmp al,3ah 
    jl printit
    add al,7h 
printit: 
    mov dl,al 
    mov ah,2
    int 21h 
    ret
htoa endp
code ends 
end main