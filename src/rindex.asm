;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                              ;;
;; x86-64 linux nasm assembly                   ;;
;; Nathan Casabieille                           ;;
;; File description:                            ;;
;; Locate last occurence of character in string ;;
;;                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

segment .text

global my_rindex:function

;; char *rindex(const char *s, int c)
;; Inputs   :  rdi = offset s, rsi = character c
;; Outputs  :  rax = pointer to the matched character
;; Clobbers :  rdx, rbx
my_rindex:
    xor rbx, rbx
    xor rdx, rdx

    mov rax, rsi

    .loop:
        cmp byte [rdi + rbx], 0
        je .done

        cmp byte [rdi + rbx], sil
        je .save_addr

        inc rbx

        jmp .loop

    .save_addr:
        mov rdx, rbx
        inc rbx
        jmp .loop

    .null:
        mov rax, 0
        ret

    .done:
        cmp rdx, 0
        je .null

        mov rax, rdi
        add rax, rdx
        ret
