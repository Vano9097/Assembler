.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 1124   
  b dd 128 
  mas dd 2147483648
  n db 32
.CODE
main:
mov cl, n
mov eax, a
mov ebx, mas
not ebx
start_loop: 
  cmp eax, b
  jb ex
  and eax, ebx
  shr ebx, 1
  
  jmp start_loop
  
   
ex:
  mov a, eax
  call exit
  
END main
