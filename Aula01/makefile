TARGET = hello
OBJECTS = hello.o

all: $(OBJECTS)
	ld -s -o $(TARGET) $(OBJECTS)

%.o: %.asm
	nasm -f elf64 $<

clean:
	rm -rf *.o;
	rm -rf *.lst;
	rm -rf $(TARGET)