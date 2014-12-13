assume cs:code, ds: data
data segment public
	extern a: word
	extern b: word
	x dw c
data ends

code segment public
extern ReadInteger
start:
	mov ax, data
	mov ds, ax
	
	call ReadInteger
	mov c, bx

	mov 4c00h
code ends
end start