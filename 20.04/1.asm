.486
.model flat, stdcall
INCLUDE stdlib.inc

INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA
  f_mess db "Enter integer: ", 0
  f_ret db 13, 10, 0
  
  val1 dd ?

  f_in db "%u", 0
  f_out db "rez = %d" 
        db 13, 10, 0

.CODE
main:
  push offset f_mess
  call printf
  add esp, 4

  push offset val1
  push offset f_in
  call scanf 
  add esp, 8
  
  push offset f_ret
  call printf
  add esp, 4

  mov eax, val1
  add eax, 10
  mov val1, eax

 
  push dword ptr val1
  push offset f_out
  call printf 
  add esp, 8

  
  call exit
  
END main
	  






