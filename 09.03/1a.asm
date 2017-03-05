.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a db 13   ; количество чисел  > 0 !!!!
  fib dd ?  ; для результата
.CODE
main:
  mov al, a
  not al
  mov dl, 00000001b
  
start_loop:

  mov bl, al
  and bl, dl
  jz add1
  not dl
  and al, dl
  not dl
  shl dl, 1
  jmp start_loop
  
  
add1:
  or al, dl
  mov a, al
  
  call exit
END main






