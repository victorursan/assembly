;14. The word A is given. Obtain the integer number n represented on the bits 13-15 of A.
;Then obtain the word B by rotating A n positions to the left.

assume cs:code, ds:data
data segment
  a dw 0111011101010111b
  n db ?
  b dw ?
data ends

code segment
start:
  mov ax, data
  mov ds, ax

  mov bx, 0                   ;initialize ax with 0

  mov ax, a                   ;move in ax the value of a
  and ax, 1110000000000000b   ;isolate bits 13-15
  mov cl, 13
  shr ax, cl                  ;shift ax, 13 bits to the left 
  mov n, al                   ;move the lower part of ax (al) into n 

  mov ax, a                   ;move in ax the value of a
  mov cl, n                   ;may be a redundent line
  rol ax, cl                  ;rotates to the left n positions
  or bx, ax                   ;move the shifted register (ax) into bx
  mov b, bx                   ;move the result into b

  mov ax, 4c00h
  int 21h
code ends
end start
