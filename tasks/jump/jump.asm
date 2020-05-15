; This program shows how a unconditional jump works.

global asm_func

section .text

asm_func:             ; this is our entry point
  mov rax, 1024       ; set RAX to 1024

  jmp a_place_to_jump ; Jump to label a_place_to_jump.
                      ; try to comment this jmp line and see what happens.


this_is_not_executed: ; this has been skipped...
  mov rax, 512        ; so RAX is not altered



another_jump:                                      ; we will jump here later...
  inc rax                                          ; increment RAX 
  ret                                              ; and exit the program.


a_place_to_jump:      ; the first jump land us here...
  add rax, rax        ; we double RAX
  jmp another_jump    ; and now we jump to the 
                      ; label another_jump above
