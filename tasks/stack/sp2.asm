; This program uses the stack to allocate "local variables", referring to
; these variables several times to do some operations.

section .text
global asm_func

asm_func:
  sub rsp, 16                ; we will use 4 32-bit (4-byte) "local" variables,
                             ; i.e. variables allocated on the stack
  mov dword [rsp], 1         ; puts 1 in our first variable (let's call it x)
  mov dword [rsp + 4], 3     ; y = 3
  mov dword [rsp + 8], 7     ; z = 7
  mov dword [rsp + 12], 10   ; w = 10

  xor rax, rax
  mov eax, [rsp + 8]         ; copies z to EAX
  add eax, [rsp + 12]        ; adds w to EAX
  sub eax, [rsp]             ; subtracts x from EAX
  imul eax, [rsp + 4]        ; multiplies EAX by y
  mov [rsp + 4], eax         ; puts result in y (y = (z + w - x) * y)

  mov eax, [rsp]             ; copies x to EAX
  add [rsp + 12], eax        ; add EAX (=x) to w
  mov eax, [rsp + 4]         ; puts y in EAX
  add eax, [rsp + 12]        ; adds w to EAX

  add rsp, 16                ; clears the stack
  ret
