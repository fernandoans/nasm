runme: troca.cpp troca.o
	g++ troca.o troca.cpp -o runme

troca.o: troca.asm
	nasm -f elf64 troca.asm -o troca.o
