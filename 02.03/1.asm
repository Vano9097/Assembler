.486

.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  av dd 1
  bv dd 2
  cv dd ?
.CODE
main:
  mov eax, av
  add eax, bv
  mov cv, eax
  ; add xxx yyy - xxx <- xxx+yyy
  ; sub xxx yyy - xxx <- xxx-yyy
  ; mul - беззнаковое умножение
  ; imul - знаковое умножение
  ; div - беззнаковое деление
  ; idiv - знаковое деление
  call exit
END main
	  






