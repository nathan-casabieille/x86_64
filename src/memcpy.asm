;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            ;;
;; x86-64 linux nasm assembly ;;
;; Nathan Casabieille         ;;
;; File description:          ;;
;; Copy memory area           ;;
;;                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

segment .text

global my_memcpy:function

;; void *memcpy(void *dest, const void *src, size_t n)
;; Inputs   :  rdi = offset dest, rsi = offset src, rdx = number of bytes to copy
;; Outputs  :  rax = pointer to the memory area dest
;; Clobbers :  <none>
my_memcpy:
    xor rbx, rbx

    .loop:
        cmp rbx, rdx
        je .done

        mov al, byte [rsi + rbx]
        mov byte [rdi + rbx], al

        inc rbx

        jmp .loop

    .done:
        mov rax, rdi
        ret
