# ------------------------------------------
# Programa para obter o ID do Processador
# ------------------------------------------
# Compilar..: as -o processador.o processador.s
# Linkeditar: ld -o processador processador.o
# ------------------------------------------
.section .data

output:
    #                              x   x   x 
    #       01234567890123456789012345678901234567 <- 37
    .ascii "Seu Processador eh um 'xxxxxxxxxxxx'\n"

.section .text

.globl _start

_start:
    movl $0, %eax
    cpuid
    movl $output, %edi
    movl %ebx, 23(%edi)
    movl %edx, 27(%edi)
    movl %ecx, 31(%edi)
    movl $4, %eax
    movl $1, %ebx
    movl $output, %ecx
    movl $37, %edx
    int $0x80
    
    movl $1, %eax
    movl $0, %ebx
    int $0x80
