;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;; x86-64 linux nasm assembly                ;;
;; Nathan Casabieille                        ;;
;; File description:                         ;;
;; search a string for any of a set of bytes ;;
;;                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text

extern my_strchr

global my_strpbrk:function

;; char *strpbrk(const char *s, const char *accept);
;; Inputs   :  rdi = offset string, rsi = set of bytes
;; Outputs  :  rax = pointer to the first occurence of the character in the string buffer
;; Clobbers :  rcx
my_strpbrk:
    xor rbx, rbx
    jmp .loop

    inc rbx

    .loop:
	mov al, byte [rdi + rbx]

        cmp al, 0
        je .null

        xor rcx, rcx

      	jmp .search

    .increment:
	inc rbx
        jmp .loop

    .search:
        mov dl, byte [rsi + rcx]

	cmp dl, 0
	je .increment

	cmp al, dl
        je .ret

        inc rcx

        jmp .search

    .null:
       	xor rax, rax
      	ret

    .ret:
	mov rax, rdi
	add rax, rbx
        ret
