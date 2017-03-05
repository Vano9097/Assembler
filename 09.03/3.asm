.486

.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 10
  b dd -80 

  d dd ?
.CODE
main:
  mov eax, a
  cmp eax, b
  jge less
  mov eax, b
less:
  mov d, eax
END main