assume cs:code,ds:data
stack segment
dw 100 dup(0)
stack ends
data segment
FLAGS dw 0249H
data ends
code segment
start:
    mov ax,data
    mov ds,ax
    mov ax,stack
    mov sp,ax
    mov sp,100H
    int 08h
    mov ax,4c00h
    int 21
code ends
end start