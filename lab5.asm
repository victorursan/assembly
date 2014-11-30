assume cs:code, ds:data
data segment
    a dw 0111011101010111b
    b dw 1001101110111110b
    c dw ?
data ends

code segment
start:
  mov ax, data ; we load in ds the address of data segment
  mov ds, ax

  mov bx, 0 ; we compute the result in bx

  mov ax, b ; we isolate the bits 10-12 of b
  and ax, 0001110000000000b
  mov cl, 10
  ror ax, cl ; we rotate 10 positions to the right
  or bx, ax ; we put the bits into the result

  or bx, 0000000001111000b ; we force the value of bits 3-6 to 1

  mov ax, a ; we isolate the bits 1-4 of a
  and ax, 0000000000011110b
  mov cl, 6
  rol ax, cl ; we rotate 6 positions to the left
  or bx, ax ; we put the bits into the result

  and bx, 1110011111111111b ; we force the value of bits 11-12 to 0

  mov ax, b
  not ax ; we invert the value of b
  and ax, 0000011100000000b ; we isolated the bits 9-11 of b
  mov cl, 4
  rol ax, cl ; we shift 4 positions to the left
  or bx, ax ; we put the bits into the result

  mov c, bx ; we put the value of the register into the memory location for the result

  mov ax, 4c00h
  int 21h
code ends
end start
