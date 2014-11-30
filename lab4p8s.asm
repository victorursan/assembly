;8. 1/a+200*b-c/(d+1)+e
;a,b-word; c,d-byte; e-doubleword

assume cs: code, ds: data

data segment
  a dw 1
  b dw -1
  c db 2
  d db 1
  e dd 101
  x dd ?
data ends

code segment
start:
  mov ax, data
  mov ds, ax 

  mov ax, 1         ;ax = 1
  cwd	              ;dx:ax = 1
  idiv a            ;ax = 1/a (we will ignore the remainder in dx)
  mov cx, ax        ;cx = 1/a
  

  mov al, d         ;al = d
  adc al, 1         ;al = d + 1
  cbw               ;ax = d + 1
  mov bx, ax        ;bx = ax = d + 1

  mov al, c         ;al = c
  cbw               ;ax = c
  cwd               ;dx:ax = c

  idiv bx           ;ax = c/(d + 1) (we will ignore the remainder in dx)
  sbb cx, ax        ;cx = cx - ax = 1/a - c/(d + 1)
  mov ax, 200       ;dx = 200
  imul b            ;dx:ax = 200*b
  add ax, word ptr e  
  adc dx, word ptr e + 2  ;dx:ax = 200*b + e
  mov bx, ax        ;bx = ax 
  mov ax, cx        ;ax = 1/a - c/(d + 1)
  mov cx, dx        ;cx = dx => cx: bx = dx: ax = 200*b + e
  cwd               ;dx: ax = 1/a - c/(d + 1)

  add ax, bx        
  adc dx, cx        ;dx: ax = 1/a + 200*b - c/(d + 1) + e
  mov word ptr x, ax
  mov word ptr x + 2, dx ;x = 1/a + 200*b - c/(d + 1) + e


  mov ax, 4C00h
  int 21h
code ends
end start
