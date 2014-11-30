;10. A byte string S is given. Obtain in the string D the set of the elements of S.
;Exemple:
;S: 1, 4, 2, 4, 8, 2, 1, 1
;D: 1, 4, 2, 8

assume cs: code, ds: data
data segment
  s db 1, 4, 2, 4, 1, 2, 1, 1
  l EQU $ - s
  d db l dup (?)
data ends

code segment
start:
  mov ax, data
  mov ds, ax

  mov cx, l
  mov si, 0
  mov bx, 0
  jcxz Sfarsit
  rep:
    mov al, s[si]
    mov di, 0
    mov dx, cx
    mov cx, l
    jcxz Sfarsit
    rep2:
      cmp al, d[di]
      jz next
      inc di
      loop rep2
    mov d[bx], al
    inc bx
    next:
    mov cx, dx
    inc si
    loop rep
  Sfarsit: 
  mov ax, 4C00h
  int 21h
code ends
end start
