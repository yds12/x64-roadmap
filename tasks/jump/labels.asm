; Another program showing jumps and labels.

global asm_func

section .text

asm_func:             ; this is our entry point

part_one:     ; Every instruction in an assembly code has a memory address.
              ; A label simply lets us access this address, so that we can,
              ; among other things, jump to the instruction that lives there.
              ; Note that part_one is the address of the instruction
              ; mov rax, 0 below, as a label is not an instruction.

  mov rax, 0  ; the address of this instruction is "saved" in the label
              ; part_one


part_two:     ; After the mov rax, 0 above, mov rdx, 10 is immediately
              ; executed. The label part_two does not affect the order of
              ; execution.
  mov rdx, 10
  mov rax, rdx
  jmp part_three


part_five:
  dec rdx
  jmp part_six


part_four:
  add rax, rdx
  jmp part_five



part_three:
  inc rdx
  inc rdx
  jmp part_four



part_six:
  sub rax, rdx
  ret
