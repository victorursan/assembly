assume cs: code, ds: data

data segment
  
  a dd 12345678h
  b dd 1111ffffh
  x dd ?

data ends

code segment
start:
  mov ax, data
  mov ds, ax

  mov ax, word ptr a        ;ax = 5678h
  mov dx, word ptr a + 2    ;dx = 1234h
  add ax, word ptr b        ;ax = 5678h + ffffh
  adc dx, word ptr b + 2    ;dx = 1234h + 1111h + carry
  mov word ptr x, ax
  mov word ptr x + 2, dx

  mov ax, 4C00h
  int 21h
code ends
end start