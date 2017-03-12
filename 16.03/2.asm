.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a db 6   ; количество чисел  > 0 !!!!
  mas1 db 2  ; для результата
  mas2 db 1
  n db 8
.CODE
main:
  mov cl, 8
start_loop:


  cmp cl, 0
  jz ex
  sub cl, 2
  mov al, mas1
  mov bl, mas2
  shl al, cl
  shl bl, cl
  and al, a
  and bl, a
  shl bl, 1
  shr al, 1
  cmp al, 0
  je Not_Al
  or a, al
Next:  
  cmp bl, 0
  je Not_Bl 
  or a, bl
  jmp start_loop
  
Not_Al:
  mov al, mas1
  shl al, cl
  shr al, 1
  not al
  and a, al
  jmp Next
  
Not_Bl:
  mov bl, mas2
  shl bl, cl
  shl bl, 1
  not bl
  and a, bl
  jmp start_loop
  
  
  
  
  
   
ex:
  
  call exit
END main
