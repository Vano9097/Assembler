.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
;  вызов 1
  mov eax, 1
  call inc_eax

; вызов 2
  mov eax, 10
  call inc_eax
  
  call exit

;----------------------------------
; Процедура увеличивает регистр eax на 1
; Входные данные:
;   eax - данные для инкремента
; Выходные данные:
;   eax - результат инкремента
inc_eax:
  inc eax
  ret
  
END main




