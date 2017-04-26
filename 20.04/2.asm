.486
.model flat, stdcall
INCLUDE stdlib.inc

; Функции ввода-вывода
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA
  f_mess db "Enter 2 integers: ", 0
  f_ret db 13, 10, 0
  
  val1 dd ?
  val2 dd ?
  rez dd ?

  f_in db "%d%d", 0
  f_out db "rez = %d" 
        db 13, 10, 0

.CODE
main:
  push offset f_mess
  call printf
  add esp, 4

  push offset val2
  push offset val1
  push offset f_in
  call scanf 
  add esp, 12
  
  push offset f_ret
  call printf
  add esp, 4
  
  
  mov eax, val1
  cmp eax, 0
  jge next1
  neg eax
next1:
  mov ebx, val2
  cmp ebx, 0
  jge gcd
  neg ebx
  
gcd:
  cmp ebx, 0
  jz stop 
  mov ecx, ebx
  cdq
  div ebx 
  mov ebx, edx
  mov eax, ecx
  jmp gcd     
stop:
  mov rez, eax
  
  
  push dword ptr rez
  push offset f_out
  call printf 
  add esp, 8

  
  call exit
  
END main
	  






