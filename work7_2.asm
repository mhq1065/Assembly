ASSUME CS:CODE, DS:DATA
DATA   SEGMENT
; DISPFILE DB  20				    ;预定义20字节的空间
;     DB  ?				    ;待输入完成后，自动获得输入的字符个数
;     DB  20  DUP(0)
    NAMELIST STRUC
        MAXLEN db 100
        ACTLEN DB ?
        NAMEIN DB 100 dup(?)
    NAMELIST ENDS
    DISPFILE NAMELIST<>
DATA   ENDS


CODE   SEGMENT
START:
    MOV AX, DATA
    MOV DS, AX

    LEA DX,DISPFILE                        ;接收字符串
    MOV AH, 0AH
    INT 21H

    MOV AH, 4CH                          ;返回DOS系统
    INT 21H
CODE   ENDS                                  
END    START
