;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                              ;;
;; x86-64 linux nasm assembly                                                   ;;
;; Nathan Casabieille                                                           ;;
;; File description:                                                            ;;
;; returns a pointer to the first occurrence of the character c in the string s ;;
;;                                                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text

extern strlen

global strchr:function

;; char *strchr(const char *s, int c);
;; Inputs   :  rdi = offset string, rsi = character to find
;; Outputs  :  rax = pointer to the first occurence of the character in the string buffer
;; Clobbers :  rdi, rsi, rcx
strchr:
    push rsi
    call strlen WRT ..plt
    mov rcx, rax
    inc rcx
    pop rsi

    cld
    mov rax, rsi
    repne scasb
    dec rdi
    mov rax, rdi

    ret
