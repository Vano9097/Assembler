.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 1024   
  b dd 1029
  n db 32
  k db 0
.CODE
main:
mov eax,a
xor eax, b
mov ebx, 01111111111111111111111111111111b
not ebx
start_loop: 
  cmp n, 0
  je ex
  dec n
  test eax, ebx
  je next
  inc k
next:
  shr ebx, 1  
  jmp start_loop
  
   
ex:
  call exit
  
END main
