.486

.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 5
  d1 dd 2
  d2 dd 3
  rez dd ?
.CODE
main:
  mov eax, a
  cdq
  mov ebx, d1
  idiv ebx
  mov cl, dl
  mov eax, a
  cdq
  mov ebx, d2
  idiv ebx
  mov ah, dl
  mov al,cl
  ; add xxx yyy - xxx <- xxx+yyy
  ; sub xxx yyy - xxx <- xxx-yyy
  ; mul - беззнаковое умножение
  ; imul - знаковое умножение
  ; div - беззнаковое деление
  ; idiv - знаковое деление
  call exit
END main
	  






