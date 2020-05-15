; This program calculates a power of 2 by building a simple loop using jumps, 
; comparisons and increments

global asm_func

section .text

asm_func:
  mov rdx, 8    ; this is our exponent
  mov rax, 2    ; this is the base
  mov rcx, 1    ; our counter

loop:
  add rax, rax  ; doubles RAX
  inc rcx       ; increments our counter
  cmp rcx, rdx  ; did we do this enough times?
  jl loop       ; if not, jump back to loop

  ret           ; and return... return value is in RAX (should be 2^8)
