.486

.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 100
  b dd 20
  rez dd ?
.CODE
main:
  mov eax, a
  mov ebx, b
gcd:
  cmp ebx, 0
  jz stop 
  mov ecx, ebx
  cdq
  div ebx 
  mov ebx, edx
  mov eax, ecx
  jmp gcd     ; продолжаем поиск
stop:
  mov rez, eax
  call exit
END main