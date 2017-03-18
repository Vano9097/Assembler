.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a db 7 
  n db 4
.CODE
main:
mov cl, n
; mov al,0
; mov ah,0

; start_loop:
  ; cmp n, 0
  ; je next
  ; dec n
  ; shl al, 2
  ; or al, 1
  ; shl ah, 2
  ; or ah, 2
  ; jmp start_loop
; next: 
  mov al, 01010101b
  mov ah, 10101010b
  and al, a
  and ah, a
  shr ah, 1
  shl al, 1
  or al, ah
  mov a, al  
   
; ex:
  
  call exit
END main
