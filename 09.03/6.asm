.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  n db 1   ; количество чисел  > 0 !!!!
  fib dd ?  ; для результата
  

.CODE
main:
  mov eax, 0   
  mov ebx, 1   
  mov edx, 0
  
  mov ecx, 0
  mov cl, n    ; счетчик
  inc cl

start_loop:  
  mov edx, eax
  add eax, ebx
  mov ebx, edx
  
  loop start_loop  ; уменьшить ecx и перейти, если не ноль
  
  mov fib, eax
  
  call exit
END main






