// 
// hello world 64 bit ARM arch apple sillicon 
//

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
    // first 7 registers of X variety are for paramaters
    // setting myself up for a function call, passing in the number 0 and its going to go into the first register
    // return 0
    // X is for 64 bit
    mov X0, #0 // return 0
    // another register, this is a supervisor call
    // termination is represented by number 1
    mov X16, #1 // terminate
    // make the supervisor call
    svc 0 // syscall

// hello world string
helloworld: .ascii "Hello, world\n"
    
