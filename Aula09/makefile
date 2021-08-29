
runme: questao.cpp questao.o
	g++ questao.o questao.cpp -o runme

questao.o: questao.asm
	nasm -felf64 questao.asm -o questao.o
