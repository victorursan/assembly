assume cs:code, ds:data

data segment
data ends
 
EXTRN result:BYTE
PUBLIC Concat
 
code segment
  Concat PROC
    push ds
    pop es
    ;ax=offset s1, bx=offset s2, cx=offset s3
    mov di, offset result ;destination string
    mov si, ax ;starting point s1

    repeta:
      lodsb ; loads first byte into al
      cmp al, 0
      je cont ;if empty, go to the next one
      stosb ;else, store it
      jmp repeta ;repeat until empty

    cont:
      mov si, bx ;starting point of s2
   
    repeta1:
      lodsb ;loads second string into al
      cmp al, 0
      je cont1
      stosb
      jmp repeta1
           
    cont1:
      mov si, cx
           
    repeta2:
      lodsb
      cmp al, 0
      je dupa
      stosb
      jmp repeta2

    dupa:
      mov al, '$'
      stosb                  

    ret
  Concat ENDP
 
code ends
end