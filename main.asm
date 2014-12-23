;Three character strings are given.
;Compute and print on the screen the result of their concatenation.

assume cs:code, ds:data
data segment
  s1 db 'Merry', 0
  s2 db 'Christmas', 0
  s3 db '!', 0
  l equ $ - s1 - 3
  result db l dup(?)
data ends
 
PUBLIC result
EXTRN Concat:PROC
 
code segment
start:
  mov ax, data
  mov ds, ax

  mov ax, offset s1
  mov bx, offset s2
  mov cx, offset s3
  call Concat

  mov ah, 09h
  lea dx, result
  int 21h

  mov ax, 4c00h
  int 21h
code ends
end start
 
