assume cs:code, ds:data,ss:stack
data segment
    TABLE DW 1,1,3,3,4,6,7,8,8,9,9,11,12,12,13,15,21,22,23,23,24,24,25,25,29,102,121,212,215,215,215,215
;length
long equ ($-TABLE)
data ends
stack segment
    dw 10 dup(0)
stack ends
code segment
start:
    ;register init
    mov ax,data
    mov ds,ax
    mov ax,stack
    mov ss,ax
    mov sp,12

    mov ax,TABLE[bx];出现次数最多的数
    mov cx,2;出现次数最多的数 占字节数
    mov dx,TABLE[bx];当前值
    mov si,2;当前值占字节数
    mov bx,0;当前值的基址

;将bx+si指向后一个不同的值
l:  cmp dx, TABLE[bx+si]
    jne p
    add si,2
    call judge
    jmp l

;比较当前数的长度和历史最长
p:  cmp cx,si
    jnb e
    ;更新最长的值和长度
    mov ax,dx
    mov cx,si
e:
;准备下一个值
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
;将字节数转化为字数
    mov bx,ax
    mov ax,cx
    mov dx,2
    div dl
    mov cx,ax
    mov ax,bx

    mov   ax, 4c00h
    int   21h

;判断下标是否越界
judge:
    mov bp,bx
    add bp,si
    cmp bp,long
    jnb exit
    ret


code ends
end start 