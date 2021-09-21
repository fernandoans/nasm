NOME = decisao

runme: ${NOME}.cpp ${NOME}.o
	   g++ ${NOME}.o ${NOME}.cpp -o runme

%.o: %.asm
	nasm -f elf64 $<