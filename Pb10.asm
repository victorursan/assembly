;Sa se afiseze atributele unui fisier al carui nume se da de la tastatura
assume ds:data, cs:code

data segment
  maxFile	    db 13
  lenFile	    db ?
  strFile	    db 13 dup('$')
  msgInput	  db 'Introduceti numele fisierului:$'
  msgOutput	  db 'Atributele fisierului sunt:$'
  aReadOnly	  db ' [x] Read-only$'
  aHidden	    db ' [x] Hidden$'
  aSystem	    db ' [x] System$'
  aArchive	  db ' [x] Archive$'
  nReadOnly	  db ' [ ] Read-only$'
  nHidden	    db ' [ ] Hidden$'
  nSystem	    db ' [ ] System$'
  nArchive	  db ' [ ] Archive$'
  msgError	  db 'Eroare la accesarea atributelui fisierului (fisierul nu exista?).$'
data ends

code segment
  start:
      mov ax, data        ; ax &lt;- adresa segmentului de date
      mov ds, ax          ; ds &lt;- dseg
      mov es, ax          ; es &lt;- dseg
      
      ; Afisez un mesaj pt introducerea numelui fisierului
      mov dx, offset msgInput
      mov ah, 09h
      int 21h
      
      ; Citesc numele fisierului
      mov dx, offset maxFile      ; pointer spre input buffer
      mov ah, 0Ah                 ; buffered input
      int 21h                     ; apelez intreruperea
      
      ; Afisez un mesaj
      mov dx, offset msgOutput
      mov ah, 09h
      int 21h
      
      ; Transform numele fisierului intr-un sir ASCIIZ
      mov al, lenFile
      mov ah, 0
      mov si, ax
      mov [strFile+si], 0
      
      ; Apelez functia get/set attributes
      mov dx, offset strFile
      mov ax, 4300h
      int 21h
      jc errFisier
      
      ; Verific atributele fisierului
      test cx, 1h
      jz notReadOnly
      mov dx, offset aReadOnly
      mov ah, 09h
      int 21h
      jmp testHidden

notReadOnly:
        mov dx, offset nReadOnly
        mov ah, 09h
        int 21h
testHidden:
        test cx, 2h
        jz notHidden
        mov dx, offset aHidden
        mov ah, 09h
        int 21h
        jmp testSystem
notHidden:
        mov dx, offset nHidden
        mov ah, 09h
        int 21h
testSystem:
        test cx, 4h
        jz notSystem
        mov dx, offset aSystem
        mov ah, 09h
        int 21h
        jmp testArchive
notSystem:
        mov dx, offset nSystem
        mov ah, 09h
        int 21h
testArchive:
        test cx, 20h
        jz notArchive
        mov dx, offset aArchive
        mov ah, 09h
        int 21h
        jmp sfarsit
notArchive:
        mov dx, offset nArchive
        mov ah, 09h
        int 21h
        jmp sfarsit
errFisier:
        mov dx, offset [msgError]
        mov ah, 09h
        int 21h
sfarsit:
        mov ax, 4C00h
        int 21h

code ends
  end start

