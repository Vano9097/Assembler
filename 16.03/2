.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 19   ; количество чисел  > 0 !!!!
  mas dd 1  ; для результата
  n db 3
.CODE
main:
  mov eax, a
  mov ebx, mas
  not ebx
  
  
  
start_loop:
  cmp n, 0
  jz ex
  dec n
  and eax, ebx
  shl ebx, 1
  jmp start_loop
   
ex:
  mov a, eax
  
  call exit
END main
