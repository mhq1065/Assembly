assume cs:code, ds:data,ss:stack
data segment
    MEM dw 12,23,234,234,2,10 dup(0),1,2,3,4,5,11 dup(0),0FFFFH
    long equ ($-MEM)
dw 1234H
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

    xor bx,bx;慢指针
s:  
    mov cx,MEM[bx]
    add bx,2
    cmp cx,0
    jne s
    sub bx,2

    cmp bx,long;判断是否遍历完成数组
    jnb exit

    mov bp,bx;快指针
    ;寻找下一个非零位置
l:  add bp,2
    cmp bp,long
    jnb exit
    mov cx,MEM[bp]
    jcxz l
;交换
    mov MEM[bx],cx
    mov MEM[bp],0
    add bx,2
    cmp bp,long-2
    jne l

exit:  
    mov   ax, 4c00h
    int   21h

code ends
end start 