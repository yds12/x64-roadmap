; A program that uses the overflow flag by making a conditional jump
; if there was an overflow in previous calculations.

global asm_func

section .text

asm_func:
  mov al, 01111111b  ; the most significant bit is the "sign"
  inc al             ; this increment should change the sign to negative (1)
                     ; which is an overflow
  jo overflowed      ; if it is an overflow, jump 
  mov rax, 0xbaaad
  ret                ; if not, return with 0xbaaad

overflowed:
  mov cx, 0111111111111111b  ; now try with a larger register
  inc cx
  jo overflowed_again
  mov rax, 0xbaad
  ret                        ; if it fails, return 0xbaad

overflowed_again:            
  mov al, 10000000b          ; now let's try an underflow: a negative number
                             ; (with the most significant bit as 1) but which
                             ; after a decrement becomes positive (bit turns 0)
  dec al
  jo underflowed             ; jump if overflow flag is set

  mov rax, 0xbad             ; if it fails, return 0xbad
  ret

underflowed:                 ; if it works, return 0xaee
  mov rax, 0xaee
  ret
