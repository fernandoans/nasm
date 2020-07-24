runme: param.cpp param.o
	g++ param.o param.cpp -o runme

param.o: param.asm
	nasm -felf64 param.asm -o param.o
