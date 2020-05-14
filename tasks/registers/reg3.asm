; As we saw with reg2.asm, copying into AX did not erase the upper bits of
; EAX. In this program we will see if the same happens with respect to EAX and
; RAX.

global asm_func 

section .text
asm_func:
  mov rax, 5000000000   ; move a very large number (>32-bit) into RAX
  mov eax, 3            ; puts 3 into EAX. This time, we can expect the upper
                        ; half of RAX to be erased. The behaviour for mov
                        ; differs between 32-bit destinations (the registers
                        ; which are receiving the value) and destinations of
                        ; other sizes. AFAIK, any mov to a 32-bit register will
                        ; erase the higher half of the 64-bit register. But
                        ; mov to a 16-bit register will not erase the upper
                        ; half of the 32-bit register that contains it
                        ; (let alone the half of the 64-bit register).

  ret                   ; returns to the caller (in our case, caller.c),
                        ; which will have access to the "return value" of our
                        ; program via the RAX register.
