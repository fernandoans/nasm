NOME = decisao

runme: ${NOME}.cpp ${NOME}.o
	   g++ ${NOME}.o ${NOME}.cpp -o runme

${NOME}.o: ${NOME}.asm
		nasm -felf64 ${NOME}.asm -o ${NOME}.o