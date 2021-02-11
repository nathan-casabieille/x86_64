;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                          ;;
;; x86-64 linux nasm assembly                               ;;
;; Nathan Casabieille                                       ;;
;; File description:                                        ;;
;; Compare two C-style NUL-terminated strings ignoring case ;;
;;                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text

extern my_strcmp
extern my_strtoupper

global my_strcasecmp:function

;; int strcasecmp(const char *s1, const char *s2)
;; Inputs   :  rdi = address of s1, rsi = address of s2
;; Outputs  :  rax = difference of last compared bytes
;; Clobbers :  rdi, rsi
my_strcasecmp:
    call my_strtoupper WRT ..plt
    push rax

    mov rdi, rsi
    call my_strtoupper WRT ..plt
    mov rsi, rax
    pop rax

    call my_strcmp WRT ..plt

    ret
