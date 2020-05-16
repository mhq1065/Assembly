; use simplified segment definition

title how to display a string

.model small
.stack
.data
    message   db "Hello world, I'm 16bit DOS Assembly !!!"
    crlf      db 0DH, 0AH, "$"
.code
    main    proc
        ; assign the data segment base address to DS
        mov   ax, @data
        mov   ds, ax
        
        ; display the message string
        mov   ah, 09
        lea   dx, message
        int   21h
        
        ; method 2: return to dos
        mov   ax, 4c00h
        int   21h
    main    endp
end main 