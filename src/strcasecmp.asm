;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                          ;;
;; x86-64 linux nasm assembly                               ;;
;; Nathan Casabieille                                       ;;
;; File description:                                        ;;
;; Compare two C-style NUL-terminated strings ignoring case ;;
;;                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text

global my_strcasecmp:function

;; int toupper(int c);
;; Inputs   :  al = character to convert
;; Outputs  :  al = uppercase character
;; Clobbers :  <none>
my_toupper:
    cmp al, 'a'
    jl .done

    cmp al, 'z'
    jg .done

    sub al, 32

    .done:
        ret

;; int strcasecmp(const char *s1, const char *s2)
;; Inputs   :  rdi = address of s1, rsi = address of s2
;; Outputs  :  rax = difference of last compared bytes
;; Clobbers :  rdi, rsi
my_strcasecmp:
    .loop:
	mov al, byte [rdi]
        call my_toupper
        mov ah, al

	mov al, byte [rsi]
        call my_toupper

        cmp ah, 0
	je .done

	cmp al, 0
	je .done

        cmp ah, al
	jne .done

        inc rdi
	inc rsi

        jmp .loop

    .done:
        movzx rax, byte [rdi]
	movzx rbx, byte [rsi]
	sub rax, rbx
	ret
