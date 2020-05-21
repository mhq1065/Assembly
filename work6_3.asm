assume cs:code, ds:data,ss:stack
data segment
TABLE DW 1,1,3,3,4,6,7,8,8,9,9,11,12,12,13,15,21,22,23,23,24,24,25,25,29,102,121,212,215,215,215,215
long equ 40H
data ends
stack segment
dw 10 dup(0)
stack ends
code segment
start:
    mov ax,data
    mov ds,ax
    mov ax,stack
    mov ss,ax
    mov sp,12
    xor bx,bx

    ;register init
    mov ax,TABLE[bx]
    mov dx,TABLE[bx]
    mov cx,2
    mov si,2
    mov bx,0

l:  cmp dx, TABLE[bx+si]
    jne p
    add si,2
    call judge 
    jmp l
    
p:  ;compare cx with si
    cmp cx,si
    jnb e
    mov ax,dx
    mov cx,si
e:
    add bx,si
    mov dx,TABLE[bx]
    mov si,2

    call judge
    jmp l


exit:
    ;防止数组越界后忘记比大小
    cmp cx,si
    jnb q
    mov ax,dx
    mov cx,si
q:
    mov bx,ax
    mov ax,cx
    mov dx,2
    div dl
    mov cx,ax
    mov ax,bx
    mov   ax, 4c00h
    int   21h

judge:
    mov bp,bx
    add bp,si
    cmp bp,long
    jnb exit
    ret


code ends
end start 