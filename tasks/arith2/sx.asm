; This program uses the cdq instruction to sign extend EAX to EDX:EAX, in
; order to perform a proper division with idiv.
; In binary representation of signed numbers, the most significant bit is
; treated as the sign. If it is 1, the number is negative, if it is 0 it is
; positive. To use a negative 32-bit number as a 64-bit number, we have to
; copy 1s into the remaining most significant positions of the number. This
; is called sign extension.
; As we have seen, idiv divides the number in EDX:EAX by the specified
; register. This means that if we put a negative number in EAX, we have to
; fill EDX with ones (sign extend EAX into EDX:EAX).

global asm_func 
section .text
asm_func:
  mov eax, -23
  cdq                        ; Sign extends EAX into EDX:EAX.
  mov ecx, -7
  idiv ecx                   ; divides EDX:EAX by ECX, quotient goes to EAX,
                             ; remainder to EDX.

  movsx rax, eax             ; In this case we don't really need to do this
                             ; because the result is positive, but if the
                             ; result were negative, we would need to sign
                             ; extend it to RAX if we want to read the
                             ; return value in RAX properly. This instruction
                             ; does just that.
  ret
