;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                          ;;
;; x86-64 linux nasm assembly                               ;;
;; Nathan Casabieille                                       ;;
;; File description:                                        ;;
;; Compare two C-style NUL-terminated strings               ;;
;;                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text

global strncmp:function

;; int strncmp(const char *s1, const char *s2, size_t n);
;; Inputs   :  rdi = address of s1, rsi = address of s2, rdx = nbr of characters to compare
;; Outputs  :  rax = difference of last compared bytes
;; Clobbers :  rcx
strncmp:
    cld
    mov rcx, rdx
    repe cmpsb

    movzx rax, byte [rsi - 1]
    movzx rcx, byte [rdi - 1]
    sub rcx, rax
    mov rax, rcx

    ret
