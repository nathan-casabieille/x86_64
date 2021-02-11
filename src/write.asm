;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                                                     ;;
;; x86-64 linux nasm assembly                                                                          ;;
;; Nathan Casabieille                                                                                  ;;
;; File description:                                                                                   ;;
;; Writes up to count bytes from the buffer pointed buf to the file referred to by the file descriptor ;;
;;                                                                                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

segment .bss

SYS_WRITE: equ 1

segment .text

global my_write:function

;; void write(int fd, const void *buf, size_t count);
;; Inputs   :  RDI = file descriptor, RSI = offset string, RDX = number of characters to write
;; Outputs  :  <none>
;; Clobbers :  <none>
my_write:
    mov rax, SYS_WRITE
    syscall
    ret
