;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  ;;
;; x86-64 linux nasm assembly       ;;
;; Nathan Casabieille               ;;
;; File description:                ;;
;; Fill memory with a constant byte ;;
;;                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

segment .text

global my_memset:function

;; void *memset(void *s, int c, size_t n)
;; Inputs   :  rdi = offset ptr, rsi = constant byte, rdx = number of bytes to write
;; Outputs  :  rax = pointer to the memory area s
;; Clobbers :  <none>
my_memset:
    mov rax, rdi
    .loop:
        cmp rdx, 0
        je .done
        mov byte [rdi], sil
        inc rdi
        dec rdx
        jmp .loop
    .done:
        ret
