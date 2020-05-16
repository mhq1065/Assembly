; use full segment definition

title how to display a string

data segment
    message   db "Hello world, I'm 16bit DOS Assembly !!!"
    crlf      db 0DH, 0AH, "$"
data ends

code segment
    assume cs:code, ds:data
    main    proc
        ; assign the data segment base address to DS
        mov   ax, data
        mov   ds, ax
        
        ; display the message string
        mov   ah, 09
        lea   dx, message
        int   21h
        
        ; method 2: return to dos
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 