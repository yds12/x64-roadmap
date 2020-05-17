; This program shows the difference between conditions "less" and "below",
; and "greater than" and "above".

global asm_func

section .text

asm_func:
  mov al, -1
  mov dl, 1
  cmp al, dl  ; here we compare AL with DL
  jl is_less  ; and jump if AL is less than DL (if -1 < 1)
  mov rax, 0xbaaad
  ret         ; if not, jump with error code

is_less:
  cmp al, dl  ; now we compare AL and DL again

  jb is_below ; But this time we jump if AL is below DL. The difference
              ; between less and below is that less considers the numbers to
              ; be signed, but below considers the numbers to be unsigned.
              ; As we have seen earlier, negative numbers have 1s as their
              ; most significant digits, so they are "above" positive numbers,
              ; when read as unsigned binary numbers (11111111 > 00000001).
  cmp al, dl
  ja is_above ; now we jump if AL is above DL (it is).
  mov rax, 0xbad
  ret         ; if no jump, return with error

is_above:
  mov rax, 0xaee
  ret

is_below:
  mov rax, 0xbaad
  ret
