;1. Two byte strings S1 and S2 are given. Obtain the string D by concatenating the elements of S1 from the
;   left hand side to the right hand side and the elements of S2 from the right hand side to the left hand side.
;Exemple:  
;S1: 1, 2, 3, 4
;S2: 5, 6, 7
;D: 1, 2, 3, 4, 7, 6, 5


assume cs: code, ds: data
data segment
  s1 db 1, 2, 3, 4
  l1 equ $ - s1
  s2 db 5, 6, 7
  l2 equ $ - s2
  d db ?
data ends

code segment
start:
  mov ax, data
  mov ds, ax

  mov cx, l1
  mov bx, 0
  firstS:
    mov dl, byte ptr s1 + bx
    mov byte ptr d + bx, dl
    inc bx
    loop firstS

  mov cx, l2
  mov ax, bx
  secondS: 
    mov bx, cx
    dec bx
    mov dl, byte ptr s2 + bx
    mov bx, ax 
    mov byte ptr d + bx, dl
    inc bx
    mov ax, bx
    loop secondS

  mov ax, 4C00h
  int 21h
code ends
end start