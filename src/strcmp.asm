;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                          ;;
;; x86-64 linux nasm assembly                               ;;
;; Nathan Casabieille                                       ;;
;; File description:                                        ;;
;; Compare two C-style NUL-terminated strings               ;;
;;                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text

extern my_strlen
extern my_strncmp

global my_strcmp:function

;; int strcmp(const char *s1, const char *s2)
;; Inputs   :  rdi = address of s1, rsi = address of s2
;; Outputs  :  rax = difference of last compared bytes
;; Clobbers :  rdx, rcx
my_strcmp:
    push rsi
    call my_strlen WRT ..plt
    mov rdx, rax
    pop rsi

    call my_strncmp WRT ..plt

    ret
