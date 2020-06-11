; This program performs a division operation.
; The idiv instruction is quite complicated compared to other basic arithmetic
; instructions. For more information, see:
;
;     https://www.felixcloutier.com/x86/idiv
;
; The idiv instruction is for signed number division, and div for unsigned.
;

global asm_func

section .text
asm_func:
  xor rdx, rdx               ; A possible 128-bit dividend for the idiv
  mov rax, 100               ; instruction is given by RDX:RAX, so we clear
                             ; RDX and set RAX to 100.

  mov rcx, 9                 ; the divisor will be 9, in RCX

  idiv rcx                   ; since the idiv operand (the divisor) has size 
                             ; 64 bits, the dividend will be considered to be
                             ; in RDX:RAX as stated above.

  add rax, rdx               ; The result (quotient) goes to RAX, and the
                             ; remainder goes to RDX.

  mov r10, rax               ; let's save the result in R10

  xor edx, edx               ; Now let's divide 17 by 5, but using 32-bit
  mov eax, 17                ; registers. The dividend will be in EDX:EAX,
  mov ecx, 5                 ; and the divisor in ECX.

  idiv ecx                   ; Now the quotient will be in EAX and the
                             ; remainder in EDX.

  add eax, edx               ; sum the quotient and remainder
  add eax, r10d              ; sum with the previous result

  ret                        ; the return value is in RAX
