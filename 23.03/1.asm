.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  LEN_AR EQU 6
  arr dw 123,456,234,112,45654,234
  sum dd 0
  prod dd ?
  
  ; произведение в edx
  
.CODE
main:
  mov ecx, LEN_AR
  mov esi, offset arr
  mov eax, 1
start:  
  dec ecx
  jl stop
  xor ebx, ebx
  mov bx, [esi]
  mul ebx
  
  add sum, ebx
  
  add esi, TYPE arr
  
  jmp start
  
stop:
  mov prod, eax
  call exit
END main
