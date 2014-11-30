;x = (yy + 192) - h + (d - m)

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

  mov ax, yy  ;ax = yy
  mov bx, 192 ;bx = 192
  add ax, bx  ;ax = yy + 192
  sub ax, h   ;ax = yy + 192 - h
  mov bx, ax  ;bx = ax = yy + 192 - h
  mov al, d   ;al = d
  sub al, m   ;al = d - m
  cbw         ;ax = d - m 
  add bx, ax  ;bx = bx + ax
  mov x, bx   ;x  = bx = (yy + 192) - h + (d - m) 

  mov ax, 4C00h
  int 21h
code ends
end start