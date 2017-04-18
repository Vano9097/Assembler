.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  LEN1 EQU 7
  ar1 dw 2, 4, 6, 8, 1, 3, 5
  
  LEN2 EQU 7
  ar2 dw LEN2 dup(?) 

  LEN3 EQU 7
  ar3 dw LEN3 dup(?)

  a dw 5

.CODE
main:
; вызов процедуры
; укладываю данные в стек - 
; !!! порядок обратный !!!
  push dword ptr a
  push offset ar3
  push offset ar2
  push offset ar1
  push dword ptr LEN1
  call compute_array
  add esp, 20  ; очищаю стек от параметров
  
  call exit  
  
;----------------------------------
; Процедура разделяет массив на два блока
; первый, меньше a
; второй, больше или равные a


; Входные данные:
;   [ebp+8] - len(ar1)
;   [ebp+12] - addr ar1
;   [ebp+16] - addr ar2
;   [ebp+20] - addr ar3
;   [ebp+24] - a
; Выходные данные:
;   eax - длина первого блока 
;   ebx - длина второго блока
compute_array:
  push ebp
  mov ebp, esp
  
; спасаю регистры
  push ecx
  push edx
; Вычисляю длину обрабатываемой части векторов
  mov ecx, [ebp+8]   ; len(ar1) 

  mov esi, [ebp+12]  ; addr ar1
  mov eax, [ebp+16]  ; addr ar2
  mov ebx, [ebp+20]  ; addr ar3
  
; цикл обработки
start:
  dec ecx
  jl stop  
  
; сравниваю
  mov dx, [esi+2*ecx]
  cmp dx, [ebp+24]
  jae second
  mov [eax], dx
  add eax, 2
  jmp start
  second:
  mov [ebx], dx
  add ebx, 2
  jmp start
stop:  
  
; восстанавливаю регистры
  pop edx
  pop ecx
  sub eax, [ebp+16]
  shr eax, 1
  sub ebx, [ebp+20]
  shr ebx, 1
  pop ebp
  ret
  
END main




