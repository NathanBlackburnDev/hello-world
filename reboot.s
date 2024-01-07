.global _main
.align 2

// main
_main:
    b _reboot
    b _terminate

_reboot:
    mov X0, #1 // instant reboot
    mov X16, #55 // reboot
    svc 0 // syscall

_terminate:
    mov X0, #0 // return 0
    mov X16, #1 // reboot
    svc 0 // syscall
