.486

.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 25
  b dd 7
  rez1 dd ?
  rez2 dd ?
  rez3 dd ?
  
.CODE
main:
  mov eax, a
  mov ebx, b
  neg ebx
  cdq
  idiv ebx
  mov rez1, edx

  
  mov eax, a
  mov ebx, b
  neg eax
  cdq
  idiv ebx
  mov rez2, edx
  
  mov eax, a
  mov ebx, b
  neg eax
  neg ebx
  cdq
  idiv ebx
  mov rez3, edx
  
  
  ; add xxx yyy - xxx <- xxx+yyy
  ; sub xxx yyy - xxx <- xxx-yyy
  ; mul - беззнаковое умножение
  ; imul - знаковое умножение
  ; div - беззнаковое деление
  ; idiv - знаковое деление
  call exit
END main
	  






