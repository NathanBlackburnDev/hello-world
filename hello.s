.global _main
.align 2 

// main function
_main:
    b _printf
    b _terminate // call branch and then terminate

_printf: // align to printf() in c
    mov X0, #1 // stdout
    adr X1, helloworld // address of hello world string
    mov X2, #13 // bit length of hello world
    mov X16, #4 // write to stdout
    svc 0

_reboot:
    mov X0, #1
    mov X16, #55
    svc 0

_terminate:
    mov X0, #0 // return 0
    mov X16, #1 // terminate
    svc 0 // syscall
    
helloworld: .ascii "Hello, world\n"
    
