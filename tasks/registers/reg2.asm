; This program will show how copies from registers of lower size into
; registers of larger sizes work. We make the asm_func global so we can call
; it with our C program that prints the value in RAX.

global asm_func 

section .text
asm_func:

  mov eax, 70000   ; puts 70.000 into EAX. Note that this number cannot be
                   ; represented as an 16-bit integer, but EAX is 32-bit.
  mov cx, 7        ; puts 7 in CX
  mov dx, cx       ; copies the content from CX to DX

  mov ax, dx       ; and now from DX to AX
                   ; Now note here that AX is the lower half of EAX, which
                   ; previously held a number larger than any 16-bit number.
                   ; Since AX is just 16-bit long,
                   ; this means that instead of just 7, EAX should have a big
                   ; number, with a 7 in its last 16 bits.

  ret              ; Returns control to the caller. We will use the
                   ; caller_c program to call asm_func, the return result is
                   ; whatever is stored in RAX.
