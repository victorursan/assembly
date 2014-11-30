;a. Compute the sum of the first n numbers, where n - byte, i.e. x = 1 + 2 + ... + n.
;2using only comparison and conditional jump instructions.

assume cs: code, ds: data

data segment

data ends

code segment
start:
  mov ax, data
  mov ds, ax 
  
  mov ax, 4C00h
  int 21h
code ends
end start
