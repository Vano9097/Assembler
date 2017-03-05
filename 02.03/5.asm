.486

.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  x2 dd 1
  y2 dd 1
  x1 dd 2
  y1 dd 3
  rez dd ?
.CODE
main:
  mov eax, x2
  mov ebx, y2
  sub eax, x1
  sub ebx, y1
  imul ebx
  mov rez, eax
  ; add xxx yyy - xxx <- xxx+yyy
  ; sub xxx yyy - xxx <- xxx-yyy
  ; mul - беззнаковое умножение
  ; imul - знаковое умножение
  ; div - беззнаковое деление
  ; idiv - знаковое деление
  call exit
END main
	  






