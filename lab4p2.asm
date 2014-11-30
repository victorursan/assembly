;3. x = (a * b - c) / d, where a,b,d - byte and c - double-word

assume cs: code, ds: data

data segment
  
  a db 12h
  b db 23h
  c dd 45678h
  d db 43h
  x dw ?

data ends

code segment
start:
  mov ax, data
  mov ds, ax

  mov al, a           ;al = a
  mul b               ;ax = a * b
  mov dx, 0           ;dx:ax = a * b
  sub ax, word ptr c    
  sbb dx, word ptr c + 2 ;dx:ax = a * b - c
  mov cx, ax          ;cx = ax
  mov al, d           ;al = d
  mov ah, 0           ;ah = 0 => ax = d
  mov bx, ax          
  mov ax, cx          ;ax = cx
  div bx
  mov x, ax

  mov ax, 4C00h
  int 21h
code ends
end start