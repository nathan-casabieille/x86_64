;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                          ;;
;; x86-64 linux nasm assembly                               ;;
;; Nathan Casabieille                                       ;;
;; File description:                                        ;;
;; Compare two C-style NUL-terminated strings               ;;
;;                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text

extern strlen
extern strncmp

global strcmp:function

;; int strcmp(const char *s1, const char *s2)
;; Inputs   :  rdi = address of s1, rsi = address of s2
;; Outputs  :  rax = difference of last compared bytes
;; Clobbers :  rdx, rcx
strcmp:
    push rsi
    call strlen WRT ..plt
    mov rdx, rax
    pop rsi

    call strncmp WRT ..plt

    ret
