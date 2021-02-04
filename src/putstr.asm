;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                 ;;
;; x86-64 linux nasm assembly                      ;;
;; Nathan Casabieille                              ;;
;; File description:                               ;;
;; Print a C-style NUL-terminated string to stdout ;;
;;                                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text

extern strlen
extern write

global putstr:function

;; int putstr(char const *str)
;; Inputs   :  rdi = offset string
;; Outputs  :  RAX = length of the string, without the NULL terminator
;; Clobbers :  rsi, rdx
putstr:
    call strlen WRT ..plt
    mov rdx, rax
    push rax

    mov rsi, rdi
    mov rdi, 1

    call write WRT ..plt
    pop rax

    ret
