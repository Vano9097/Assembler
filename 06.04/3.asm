.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  LENA EQU 4
  a dw 1,2,1,1
  
  rez_adr dd ?  
  len_rez dd ?
  
.CODE
main:
  mov edi, offset a
  mov eax, LENA
  mov ebx, 2
  mul ebx ; длина a
  add eax, edi
  mov esi, eax
  push esi
  push edi
  mov ecx, 0
  call pol
  cmp bl, 1
  je ok
  inc ecx
for_start:
  mov ebx, ecx
  cmp ecx, LENA
  je ok ; ok?
  sub esi, ecx
  sub esi, ecx
  start_i:
    cmp ebx, 0
    jl stop_i
    add edi, ebx
    add esi, ebx
    
    add edi, ebx
    add esi, ebx
    
    call pol
    cmp bl, 1
    je ok
    dec ebx
    jmp start_i
    
  stop_i:
  inc ecx
  pop edi
  pop esi
  push esi
  pop esi
  
  jmp for_start


ok:
  mov rez_adr, edi
  sub edi, esi
  mov len_rez, edi
  
stop:
  

  call exit
  
pol:
  ; edi - начало
  ; esi - конец
  push eax
start:
  cmp esi, edi
  jb pol_ok
  mov ax, word ptr [edi]
  cmp word ptr [esi], ax
  jne break
  
  add edi, type a
  sub esi, type a
  jmp start
 
break:
  mov bl, 0
  jmp that_s_all
 
pol_ok:
	mov bl, 1
 
that_s_all:
  pop eax
  ret
  ; bl 1 - палиндром, 0 - нет 
END main




