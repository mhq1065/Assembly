; use full segment definition

title demo make16 and error

data segment
    message   db "Hello world, I'm 16bit DOS Assembly !!!"
    crlf      db 0DH, 0AH, "$"
	;value     dw 2233h
	;extrn     xyz: byte
data ends

code segment
    assume cs:code, ds:data
    main    proc
        ; assign the data segment base address to DS
        mov   ax, data
        mov   ds, ax
        
        ; display the message string
		;mov   ah, value
        mov   ah, 09
        lea   dx, message
        int   21h
        
        ; method 2: return to dos
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 