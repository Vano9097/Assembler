.486
.model flat, stdcall
INCLUDE stdlib.inc

; Здесь компилятору рассказывается 
; о функциях ввода-вывода языка Си
INCLUDE stdio.inc

INCLUDELIB msvcrt.lib

.DATA
  a dq ?
  b dq ?
  ma dq ? 
  mi dq ?
  
  in_format db "%lf%lf", 0
  
  in_mess db "a b : ", 0
  str_ret db 13, 10, 0
  
  out_format db "max = %lf; min = %lf", 13, 10, 0
  
.CODE
main:

  push offset in_mess
  call printf
  add esp, 4
  
  push offset b
  push offset a
  push offset in_format
  call scanf
  add esp, 12
  
  push offset str_ret
  call printf
  add esp, 4



  finit     ; инициализация сопроцессора
  fld b
  fld a
  
  fcom 
  
  fstsw ax
  sahf
  
  jna bol
  
  fstp mi
  fstp ma
  jmp next
  bol:
  
  fstp ma
  fstp mi
  next:
  
  ;push dword ptr [fd+4]
  ;push dword ptr [fd]
  ;push dword ptr 0     ; плохо  :(
  push dword ptr [ma+4]
  push dword ptr [ma]
  push dword ptr [mi+4]
  push dword ptr [mi]
  
  push offset out_format
  call printf
  add esp, 20
  
  call exit  
   
END main