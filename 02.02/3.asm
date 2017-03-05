.486

.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 2
  b dd 11
  d dd 17
  rez dd ?
.CODE
main:
  mov eax, a
  mov ebx, b
 
  mul ebx
  cdq
  div d
  mov rez, edx
  ; add xxx yyy - xxx <- xxx+yyy
  ; sub xxx yyy - xxx <- xxx-yyy
  ; mul - беззнаковое умножение
  ; imul - знаковое умножение
  ; div - беззнаковое деление
  ; idiv - знаковое деление
  call exit
END main
	  






