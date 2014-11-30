;4. x = a + b, where a,b - word and a = 1234h,5678h,1234h,0; b = 1111h,2222h,3333h

assume cs: code, ds: data

data segment
  
  a dw 1234h, 5678h, 1234h, 0
  b dw 1111h, 2222h, 3333h
  x dw ?

data ends

code segment
start:
  mov ax, data
  mov ds, ax

  mov ax, b
  add a, bx

  mov ax, b + 2
  adc a + 2, ax
  
  mov ax, b + 4
  add a + 4, ax

  mov ax, a

  mov ax, 4C00h
  int 21h
code ends
end start