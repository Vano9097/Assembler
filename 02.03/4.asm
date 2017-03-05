.486

.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 55555555h
  b dd 3
  d dd 1
  e dd ?
.CODE
main:
  mov eax, a
  mov ebx, b
  mul ebx
  add eax, d
  mov e, eax
  ; add xxx yyy - xxx <- xxx+yyy
  ; sub xxx yyy - xxx <- xxx-yyy
  ; mul - беззнаковое умножение
  ; imul - знаковое умножение
  ; div - беззнаковое деление
  ; idiv - знаковое деление
  call exit
END main
	  






