;13. Four bytes are given. Obtain in AX the sum of the integer numbers
; represented on the bits 4-6 of the four bytes.

assume cs:code, ds:data
data segment
  a dw 0111011101010111b
  b dw 1001101110111110b
  c dw 1111101000100010b
  d dw 0001111110101010b
data ends

code segment
start:
  mov ax, data
  mov ds, ax

  mov ax, 0                   ;in initialize ax with 0

  mov bx, a                   ;moved in bx the value of a  
  and bx, 0000000001110000b   ;isolate bits 4-6
  mov cl, 4                   ;number of rotations
  shr bx, cl                  ;shift right 4 positions => 0000000000000111b   
  add ax, bx                  ;add the value of bx to ax

  mov bx, b                   ;moved in bx the value of b  
  and bx, 0000000001110000b   ;isolate bits 4-6
  mov cl, 4                   ;number of rotations
  shr bx, cl                  ;shift right 4 positions => 0000000000000111b   
  add ax, bx                  ;add the value of bx to ax

  mov bx, c                   ;moved in bx the value of c  
  and bx, 0000000001110000b   ;isolate bits 4-6
  mov cl, 4                   ;number of rotations
  shr bx, cl                  ;shift right 4 positions => 0000000000000111b   
  add ax, bx                  ;add the value of bx to ax

  mov bx, d                   ;moved in bx the value of d  
  and bx, 0000000001110000b   ;isolate bits 4-6
  mov cl, 4                   ;number of rotations
  shr bx, cl                  ;shift right 4 positions => 0000000000000111b   
  add ax, bx                  ;add the value of bx to ax


  mov ax, 4c00h
  int 21h
code ends
end start
