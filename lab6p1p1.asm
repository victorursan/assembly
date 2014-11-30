;a. Compute the sum of the first n numbers, where n - byte, i.e. x = 1 + 2 + ... + n.
;1.using loop instruction

assume cs: code, ds: data
data segment
	n db 10
	sum dw ?
data ends

code segment
start:
  mov ax, data
  mov ds, ax 

  mov bx, 0

  mov cl, 10
  mov ch, 0 		;cx = 10

  repeta:
  	add bx, cl
  	loop repeta

  mov sum, bx

  mov ax, 4C00h
  int 21h
code ends
end start
