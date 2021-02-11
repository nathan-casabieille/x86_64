;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                      ;;
;; x86-64 linux nasm assembly                           ;;
;; Nathan Casabieille                                   ;;
;; File description:                                    ;;
;; Convert a C-style NUL-terminated string to uppercase ;;
;;                                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text

global my_strtoupper:function

;; int toupper(int c);
;; Inputs   :  al = character to convert
;; Outputs  :  ah = uppercase character
;; Clobbers :  <none>
my_toupper:
    mov ah, al

    cmp ah, 'a'
    jl .done

    cmp ah, 'z'
    jg .done

    sub ah, 32

    .done:
        ret

;; char *strtoupper(char const *str);
;; Inputs   :  rdi = offset string
;; Outputs  :  rax = converted string
;; Clobbers :  rbx
my_strtoupper:
    xor rbx, rbx

    .repeat:
        mov al, byte [rdi + rbx]

        cmp al, 0
        je .done

        call my_toupper
        mov byte [rdi + rbx], ah

        inc rbx

        jmp .repeat

    .done:
        mov rax, rdi

        ret
