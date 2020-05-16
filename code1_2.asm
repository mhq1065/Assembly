; 学号2183310802
; BL=08h
; CL=31h
assume cs:codesg
codesg segment
start:
    mov BL,08H;data init
    mov CL,31h
    mov ax,0

    mov al,BL
	div CL
    mov BL,2
    mul BL
    mov dx,ax

    mov ax,4c00H
	int 21h
codesg ends
end start