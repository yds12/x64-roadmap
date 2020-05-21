; This program calls a print function that wraps the write syscall.
;
; The calling convention for Linux x64 is that we have to pass parameters
; in this order:
; 1st parameter: RDI
; 2nd parameter: RSI
; 3rd parameter: RDX
; 4th parameter: RCX
; 5th parameter: R8
; 6th parameter: R9
;
; Our function will take 2 parameters: string address and size. Therefore,
; we are going to use RDI and RSI to pass the parameters.

section .data
  my_text: db "Hello there", 10  ; 10 is newline
  LEN1 equ $ - my_text
  other_text: db "Another text", 10, 10
  LEN2 equ $ - other_text

section .text

global asm_func

asm_func:
  lea rdi, [rel my_text]     ; puts the address of the string to be printed
                             ; at RDI, which is the first parameter for
                             ; the function call
  mov rsi, LEN1              ; puts the string length at RSI, the 2nd param.
  call print                 ; call the function

; Makes another call to the function
  lea rdi, [rel other_text]
  mov rsi, LEN2
  call print

  xor rax, rax
  ret


; This is our function print.
; First parameter: address of string to print (RDI)
; Second parameter: size of string (RSI)
print:

; We are going to make a system call for writing to STDOUT, so we have to
; set up the parameters for that.

  mov rax, 1                 ; syscall write
  mov rdx, rsi               ; size parameter moved to RDX
  mov rsi, rdi               ; string address parameter moved to RSI
  mov rdi, 1                 ; file descriptor STDOUT
  syscall
