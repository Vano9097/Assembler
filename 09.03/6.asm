.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  n db 16   ; количество чисел  > 0 !!!!
  fib dd ?  ; для результата
  
; Записать в sum сумму первых n нечетных
; натуральных чисел
.CODE
main:
  mov eax, 0   ; текущее значение суммы
  mov ebx, 1   ; текущее слагаемое
  mov edx, 0
  
  mov ecx, 0
  mov cl, n    ; счетчик

start_loop:  
  mov edx, eax
  add eax, ebx
  mov ebx, edx
  
  loop start_loop  ; уменьшить ecx и перейти, если не ноль
  
  mov fib, eax
  
  call exit
END main






