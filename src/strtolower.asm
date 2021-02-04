;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                      ;;
;; x86-64 linux nasm assembly                           ;;
;; Nathan Casabieille                                   ;;
;; File description:                                    ;;
;; Convert a C-style NUL-terminated string to lowercase ;;
;;                                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text

global strtolower:function

;; int tolower(int c);
;; Inputs   :  al = character to convert
;; Outputs  :  ah = uppercase character
;; Clobbers :  <none>
tolower:
    mov ah, al

    cmp ah, 'A'
    jl .done

    cmp ah, 'Z'
    jg .done

    add ah, 32

    .done:
        ret

;; char *strtolower(char const *str);
;; Inputs   :  rdi = offset string
;; Outputs  :  rax = converted string
;; Clobbers :  rbx
strtolower:
    xor rbx, rbx

    .repeat:
        mov al, byte [rdi + rbx]

        cmp al, 0
        je .done

        call tolower
        mov byte [rdi + rbx], ah

        inc rbx

        jmp .repeat

    .done:
        mov rax, rdi

        ret
