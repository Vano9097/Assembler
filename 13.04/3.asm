.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  LEN1 EQU 5
  v1 dw 1, 8, 3, 9, 5
  
  LEN2 EQU 5
  v2 dw LEN2 dup(?) 

  LEN3 EQU 5
  v3 dw LEN3 dup(?)

  a dw 8

  
.CODE
main:
; вызов процедуры
; укладываю данные в стек - 
; !!! порядок обратный !!!
  push dword ptr a
  push offset v3
  push offset v2
  push offset v1
  push dword ptr LEN1
  call compute_array
  add esp, 20  ; очищаю стек от параметров
  
  call exit  
  
;----------------------------------
; Процедура пересчитывет 


; Входные данные:
;   [ebp+8] - len(v1)
;   [ebp+12] - addr v1
;   [ebp+16] - addr v2
;   [ebp+20] - addr v3
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
  mov ecx, [ebp+8]   ; len(v1) 

  mov esi, [ebp+12]  ; addr v1
  mov eax, [ebp+16]  ; addr v2
  mov ebx, [ebp+20]  ; addr v3
  
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




