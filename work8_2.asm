assume cs:code,ds:data

msg MACRO XK,N
    XK&N DB 'MESSAGE NO.&N'
    endm

JOE MACRO T
    msg TEXT,%I
    I=I+1
    ENDM
data segment
I=0
    JOE TEXT
    JOE TEXT
    JOE TEXT
data ends
code segment
start:
    mov ax,data
    mov ds,ax
    mov ax,4c00h
    int 21
code ends
end start