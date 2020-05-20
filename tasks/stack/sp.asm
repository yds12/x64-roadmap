; This program uses the stack to push and pop some values and registers.

section .text

global asm_func

asm_func:
  sub rsp, 8                 ; allocates 8 bytes of space on the stack
  mov qword [rsp], 49        ; uses it to store the value 49 there
                             ; we have to tell nasm if we want to store 49 
                             ; as a 16-bit or 64-bit value.

  mov ax, 0x0f01 
  push ax                    ; push 16-bit
  mov rax, 0xffeeddccbbaa9988
  push rax                   ; push 64-bit
  push word 300              ; push 16-bit

  xor rax, rax
  mov ax, [rsp]              ; RSP, the stack pointer, points currently to
                             ; the last element pushed onto the stack, that
                             ; is, the word 300. So here we copied 300 to AX.

  add ax, [rsp + 10]         ; Now to get the first element pushed, we need
                             ; to add an offset to RSP. The top element is
                             ; a word, i.e. has 2 bytes, and the element
                             ; before it is a qword, i.e. has 8 bytes. So
                             ; we need to use an offset of 10 to reach the
                             ; 1st element.


  pop dx                     ; if we don't pop what we pushed onto the stack,
                             ; we will cause problems to the function which
                             ; called us
  pop rdx
  pop dx                 
  pop rdx                    ; this last pop doesn't have a corresponding
                             ; push above, because we "pushed" RDX manually
                             ; in the first 2 instructions.
                         
  ret
