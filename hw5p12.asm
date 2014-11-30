;12. The words A and B are given. Obtain the word C in the following way:
;- the bits 0-6 of C have the value 0
;- the bits 7-9 of C are the same as the bits 0-2 of A
;- the bits 10-15 of C are the same as the bits 8-13 of B
assume cs: code, ds: data
data segment
  a dw 0110011100011100b
  b dw 0111100010011101b
  c dw ?
data ends

code segment
start:
  mov ax, data
  mov ds, ax 

  ;- the bits 0-6 of C have the value 0
  mov bx, 0                  ;initialize bx with 0000000000000000b 

  ;- the bits 7-9 of C are the same as the bits 0-2 of A
  mov ax, a                  ;copy in ax, a
  and ax, 0000000000000111b  ;isolate bits 0-2 from a
  mov cl, 7                  ;number of rotations 
  shl ax, cl                 ;shited left 7 positions => 0000001110000000b
  or bx, ax                  ;moved in bx the result

  ;- the bits 10-15 of C are the same as the bits 8-13 of B
  mov ax, b                  ;copy in ax, b
  and ax, 0011111100000000b  ;isolate bits 8-13 from b
  mov cl, 2                  ;number of rotations 
  shl ax, cl                 ;shited left 7 positions => 1111110000000000b
  or bx, ax                  ;moved in bx the result

  mov c, bx                  ;moved in c the result

  mov ax, 4C00h
  int 21h
code ends
end start
