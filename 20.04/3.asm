.486
.model flat, stdcall
INCLUDE stdlib.inc

; Функции ввода-вывода
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

; подразумевается что список не пуст

.DATA
  f_mess_len db "Enter length: ", 0
  f_ret db 13, 10, 0
  
  f_mess db "Enter %u integer(s): ", 0
  f_ret_i db 13, 10, 0
  
  len dd ?
  f_in_len db "%u", 0
  
  s dw 100 dup(?)
  m dw 00h
  

  f_in db "%hd", 0
  f_out db "%hd %hd" 
        db 13, 0

.CODE
main:
  push offset f_mess_len
  call printf
  add esp, 4

  push offset len
  push offset f_in_len
  call scanf 
  add esp, 8
  
  push offset f_ret
  call printf
  add esp, 4
  
  push dword ptr len
  push offset f_mess
  call printf
  add esp, 8
  
  push offset f_ret
  call printf
  add esp, 4
  
  
  mov ecx, offset s
  mov bx, 00h
  push dword ptr len
start_read:
  cmp len, 0
  jz to_print
  pusha
  
  
  push ecx
  push offset f_in
  call scanf 
  add esp, 8
  
  
  push offset f_ret_i
  call printf
  add esp, 4
  
  popa
  
  cmp bx, [ecx]
  jg next
  mov bx, [ecx]
  next:
  add ecx, 2
  dec len
  jmp start_read
  
to_print:
  mov m, bx
  pop len
  mov ecx, offset s
start_print:
  cmp len, 0
  jz ex
  xor eax, eax
  mov ax, m
  sub ax, [ecx]
  
  pusha
  push eax
  push [ecx]          ; да, знаю, но при выводе лишнее обрубается
  push offset f_out
  call printf 
  add esp, 12
  
  push offset f_ret
  call printf
  add esp, 4
  
  popa
  
  add ecx, 2
  dec len
  jmp start_print
ex: 
  call exit
  
END main
	  






