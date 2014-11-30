;x = (64+yy+yy)-(d+d)

assume cs: code, ds: data

data segment
  m db 0      ;[0, 100]
  h dw 100    ;[100, 300]
  yy dw 256   ;[0, 256]
  d db 15     ;[-3, 15]
  x dw ?      ;result can be a word
data ends

code segment
start:
  mov ax, data
  mov ds, ax

  mov bx, 64    ;bx = 64
  add bx, yy    ;ax = 64 + yy
  adc bx, yy    ;ax = 64 + yy + yy
  mov al, d     ;al = d
  add al, d     ;al = d + d
  cbw           ;ax = d + d
  sub bx, ax    ;bx = (64 + yy + yy) - (d + d)
  mov x, bx     ;x = (64 + yy + yy) - (d + d)

  mov ax, 4C00h
  int 21h
code ends
end start