; use full segment definition

title how to use add instruction

data segment
    X  db  11H
    Y  db  22H
    Z  db  ?
data ends

code segment
    assume cs:code, ds:data
    main    proc
        ; assign the data segment base address to DS
        mov   ax, data
        mov   ds, ax
        
        mov   al,  X
        add   al,  Y
        mov   Z,   al
        
        ; method 2: return to dos
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 