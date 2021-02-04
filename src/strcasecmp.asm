;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                          ;;
;; x86-64 linux nasm assembly                               ;;
;; Nathan Casabieille                                       ;;
;; File description:                                        ;;
;; Compare two C-style NUL-terminated strings ignoring case ;;
;;                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text

extern strcmp
extern strtoupper

global strcasecmp:function

;; int strcasecmp(const char *s1, const char *s2)
;; Inputs   :  rdi = address of s1, rsi = address of s2
;; Outputs  :  rax = difference of last compared bytes
;; Clobbers :  rdi, rsi
strcasecmp:
    call strtoupper WRT ..plt
    mov rdi, rax

    push rdi
    mov rdi, rsi
    call strtoupper WRT ..plt
    pop rdi
    mov rsi, rax

    call strcmp WRT ..plt

    ret
