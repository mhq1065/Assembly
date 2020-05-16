; 学号2183310802
; X=0802h
; Y=3108h
; W=3310h
assume cs:codesg,ds:data
data segment
	X dw 0802H
	Y dw 3108H
	W dw 3310H
	
data ends
codesg segment
start:
    
codesg ends
end start