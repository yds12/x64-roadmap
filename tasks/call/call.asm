; This program shows how to use the call instruction.

section .text

global asm_func

asm_func:
  mov rax, 300
  mov rdx, 212
  call add_registers         ; The call instruction internally pushes RIP
                             ; (the instruction pointer) onto the stack,
                             ; and then jumps to the specified label.

  ret                        ; Returns to caller.c. What we have been doing
                             ; all along, behind the scenes, is similar to
                             ; what we have done here in this program.



add_registers:               ; If we inspect [rsp] here, it should contain
                             ; the address of the caller (i.e., the ret
                             ; instruction right after call add_registers.

  add ax, dx                 ; do something

  ret                        ; The ret instruction pops the caller address
                             ; from the stack and jump to it.
