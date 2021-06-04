;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                          ;;
;; x86-64 linux nasm assembly                               ;;
;; Nathan Casabieille                                       ;;
;; File description:                                        ;;
;; Determines the length of a C-style NUL-terminated string ;;
;;                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text

global my_strlen:function

;; size_t strlen(char const *s)
;; Inputs   :  RDI = offset string
;; Outputs  :  EAX = length of the string, without the NULL terminator
;; Clobbers :  rsi
my_strlen:
    push rbx
    mov rbx, rdi
    mov rsi, rbx

    .repeat:
        cmp byte [rbx], 0
        je .done

        inc rbx

        jmp .repeat

    .done:
        sub rbx, rsi

        mov rax, rbx

        pop rbx
        ret
