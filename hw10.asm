;10. A string of bytes is given. Obtain the mirror image of the binary representation of this ;string of bytes. 
;Ex: The byte string is given: s db 01011100b, 10001001b, 11100101b 
;The result is the string: d db 10100111b, 10010001b, 00111010b.

assume cs:code, ds:data
data segment
  s db 01011100b, 10001001b, 11100101b
  ls equ $ - s
  d db ls dup(?)
data ends

code segment
start:
  mov ax, data
  mov ds, ax
  mov es, ax

  mov si, offset d - 1
  mov di, offset d
  mov cx, ls
  std
  repeta:
    lodsb
    mov dx, cx
    mov cx, 8
    repeta2:
      rcr al, 1
      rcl [di], 1
      loop repeta2
    inc di
    mov cx, dx
    loop repeta

  mov ax, 4C00h
  int 21h
code ends
end start