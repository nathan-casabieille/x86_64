;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;; x86-64 linux nasm assembly                                                 ;;
;; Nathan Casabieille                                                         ;;
;; File description:                                                          ;;
;; Finds the first occurrence of the substring needle in the string haystack. ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text

extern strlen
extern strncmp

global strstr:function

;; char *strstr(char *haystack, const char *needle);
;; Inputs   :  rdi = offset haystack, rsi = offset needle
;; Outputs  :  rax = pointer to the	first occurrence of the substring needle in the string haystack.
;; Clobbers :  rdi, rdx
strstr:
    push rdi
    mov rdi, rsi
    call strlen WRT ..plt
    mov rdx, rax
    pop rdi

    .loop:
        mov al, byte [rdi]
        cmp al, 0
        je .null

        cmp al, byte [rsi]
        je .compare_to_needle
        inc rdi

        jmp .loop

    .compare_to_needle:

        push rdi
        push rsi
        call strncmp WRT ..plt
        pop rsi
        pop rdi

        cmp rax, 0
        je .done

        inc rdi

        jmp .loop

     .null:
        xor rax, rax
        ret

     .done:
        mov rax, rdi
        ret
