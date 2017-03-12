.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 1024   
  b dd 1029
  mas dd 2147483648
  n db 32
  k db 0
.CODE
main:
mov eax,a
xor eax, b
mov ebx, mas
start_loop: 
  cmp n, 0
  je ex
  dec n
  mov edx, eax
  and edx, ebx
  je next
  inc k
next:
  shr ebx, 1  
  jmp start_loop
  
   
ex:
  call exit
  
END main
