;a. Given the words A and B, A = 1010111001101100b and B = 0111110100100110b, ;obtain the word C in the following way:
;bit 0 and 2 of word C are the same as the bits 0 and 1 from word A;
;bit 1 of word C is the same as bit 1 of word B
;bits 3-5 of word C take the binary value 010
;bits 6-9 of word C are the same as bits 11-14 from word A
;bits 10-15 of word C take the invert value of bits 3-8 of word B
assume cs:code, ds:data
data segment
  a dw 1010111001101100b
  b dw 0111110100100110b
  c dw ?
data ends

code segment
start:
  mov ax, data ; we load in ds the address of data segment
  mov ds, ax
  
  mov bx, 0
  mov ax, a
  and ax, 0000000000000001b
  or bx, ax

  mov ax, a
  and ax, 0000000000000010b
  mov cl, 1
  rol ax, cl
  or bx, ax
  
  mov ax, b
  and ax, 0000000000000010b
  or bx, ax

  mov ax, 0000000000010000b
  or bx, ax
  
  mov ax, a
  and ax, 0111100000000000b
  mov cl, 5
  ror ax, cl
  or bx, ax
  
  mov ax, b
  and ax, 0000000111111000b
  xor ax, 0000000111111000b
  mov cl, 7
  rol ax, cl
  or bx, ax
  mov c, bx

  mov ax, 4c00h
  int 21h
code ends
end start
