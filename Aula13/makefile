NOME = fibo2

all: $(NOME).cpp $(NOME).o
	g++ $(NOME).o $(NOME).cpp -o $(NOME)
	rm -rf $(NOME).o

%.o: %.asm
	nasm -f elf64 $<