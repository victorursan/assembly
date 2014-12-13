assume cs: code, ds:data
data segment public
  buffer db 100, ?, 100 dup(0)
  cons db 10
  a dw ?
  b dw ?
  public a
  public b
data ends

code segment public
public ReadInteger
ReadInteger proc
  mov ax, data
  mov ds, ax
  mov ah, 0Ah
  lea dx, buffer
  int 21h
  mov ch, 0
  mov cl, buffer[1]
  mov si, offset buffer[2]
  cld
  mov bx, 0
  repeat:
    lodsb
    sub al, '0'
    push ax
    mov ax, bx
    mul cons
    pop dx
    mov dh, 0
    add ax, dx
    mov bx, ax
    loop repeat
  ret 
  ReadInteger endp

start:
  mov ax, data
  mov ds, ax

  call ReadInteger
  mov a, bx
  call ReadInteger
  mov b, bx

  mov ax, 4C00h
  int 21h
code ends
end start