;x = (h + 128) - (yy + d +m)

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
  
  mov al, d   ;al = d
  add al, m   ;al = d + m 
  cbw         ;ax = d + m
  add ax, yy  ;ax = yy + d + m
  mov bx, h   ;bx = h
  add bx, 128 ;bx = h + 128
  sub bx, ax  ;bx = (h + 128) - (yy + d +m)
  mov x, bx   ;x = (h + 128) - (yy + d + m)

  mov ax, 4C00h
  int 21h
code ends
end start