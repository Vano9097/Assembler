.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 4  
  b dd 7
  n dd 0
.CODE
main:
mov eax, a
mov ebx, b


start:
  cmp eax, ebx 
  je that_s_all
  cmp eax, ebx
  ja noop           ; eax > ebx 
  sub ebx, eax
  inc n
  jmp start
  noop:
  sub eax, ebx
  inc n
  jmp start
  

that_s_all:
  inc n
  call exit

END main