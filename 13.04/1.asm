.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  LEN1 EQU 4
  v1 dw 1,4,8,9
  
  LEN2 EQU 7
  v2 dw 1, 2, 3, 4, 5, 6, 7 

  LEN3 EQU 10
  v3 dd LEN3 dup(?)

  a1 dw 200
  a2 dw -100
  
.CODE
main:
; вызов процедуры
; укладываю данные в стек - 
; !!! порядок обратный !!!
  push dword ptr a2
  push dword ptr a1
  push offset v3
  push dword ptr LEN3
  push offset v2
  push dword ptr LEN2
  push offset v1
  push dword ptr LEN1
  call compute_array
  add esp, 32  ; очищаю стек от параметров
  
  call exit  
  
;----------------------------------
; Процедура пересчитывет пару массивов по формуле 
;   v3i = a1*v1i + a2*v2i,
;     i = 1, ..., min(len(v1), len(v2), len(v3))
;   Все данные - 16-битные знаковые целые
; Входные данные:
;   [ebp+8] - len(v1)
;   [ebp+12] - addr v1
;   [ebp+16] - len(v2)
;   [ebp+20] - addr v2
;   [ebp+24] - len(v3)
;   [ebp+28] - addr v3
;   [ebp+32] - a1
;   [ebp+36] - a2
; Выходные данные:
;   нет
compute_array:
  push ebp
  mov ebp, esp
  
  pusha

  mov ecx, [ebp+8]   ; len(v1) 
  cmp ecx, [ebp+16]  ; len(v2)
  jbe skip_lenb
  
  mov ecx, [ebp+16]
skip_lenb:
  cmp ecx, [ebp+24]  ; len(v3)
  jbe skip_lenc
  
  mov ecx, [ebp+24]  ; len(v3)
skip_lenc:

  mov esi, [ebp+12]  ; addr v1
  mov edi, [ebp+20]  ; addr v2
  mov ebx, [ebp+28]  ; addr v3
  

start:
  dec ecx
  jl stop  
  
  xor eax, eax
  mov ax, [esi+2*ecx]
  imul word ptr [ebp+32]
  shl edx, 16
  add eax, edx
  push eax 
  
  xor eax,eax
  mov ax, [edi+2*ecx]
  imul word ptr [ebp+36]
  shl edx, 16
  add eax,edx
  pop edx 
  
  add eax, edx
  mov [ebx+4*ecx], eax
  jmp start
  
stop:  
  
; восстанавливаю регистры
  popa
  
  pop ebp
  ret
  
END main




