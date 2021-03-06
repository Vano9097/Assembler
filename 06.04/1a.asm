.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  
  LEN EQU 4
  a dd 28, -70, 154, 98

.CODE
main:
  mov eax, LEN
  mov esi, offset a
  call compute_array
  
  call exit
  
  
  

;----------------------------------
; НОД двух чисел
; Входные данные:
;   eax - первое число
;   ebx - второе число
; Выходные данные:
;   eax - результат 
  
NOD:

  push edx
  push ebx
  ; push eax
  ; push ebx
  ; не надо спасать
gcd:
  cmp ebx, 0
  jz stop 
  cdq
  div ebx 
  mov eax, ebx
  mov ebx, edx
  jmp gcd  
stop:
  pop ebx
  pop edx

  
 ; ответ eax
 ret
  
  
re:
   cmp ebx, 0
   jge re_exit
   neg ebx
re_exit:
  ret
  
  
compute_array:
  push eax
  mov eax, [esi]
  add esi, 4
  dec dword ptr [esp]
  
  cmp eax, 0
  jge start
  neg eax
  

start:
  cmp dword ptr [esp], 0
  je compute_array_exit
  mov ebx, [esi]
  call re
  call NOD
  dec dword ptr [esp]
  add esi, 4
  jmp start
compute_array_exit:
  add esp, 4
  ret

  
END main




