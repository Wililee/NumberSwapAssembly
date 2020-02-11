all: lab4_1 lab4_2 lab4_3 lab4_4 lab4_5

simple_io.o: simple_io.asm
	nasm -felf64 -o simple_io.o simple_io.asm
lab4_1.o: lab4_1.asm simple_io.inc
	nasm -felf64 -o lab4_1.o lab4_1.asm
lab4_1: driver.c lab4_1.o simple_io.o
	gcc -o lab4_1 driver.c lab4_1.o simple_io.o
lab4_2.o: lab4_2.asm simple_io.inc
	nasm -felf64 -o lab4_2.o lab4_2.asm
lab4_2: driver.c lab4_2.o simple_io.o
	gcc -o lab4_2 driver.c lab4_2.o simple_io.o
lab4_3.o: lab4_3.asm simple_io.inc
	nasm -felf64 -o lab4_3.o lab4_3.asm
lab4_3: driver.c lab4_3.o simple_io.o
	gcc -o lab4_3 driver.c lab4_3.o simple_io.o
lab4_4.o: lab4_4.asm simple_io.inc
	nasm -felf64 -o lab4_4.o lab4_4.asm
lab4_4: driver.c lab4_4.o simple_io.o
	gcc -o lab4_4 driver.c lab4_4.o simple_io.o
lab4_5.o: lab4_5.asm simple_io.inc
	nasm -felf64 -o lab4_5.o lab4_5.asm
lab4_5: driver.c lab4_5.o simple_io.o
	gcc -o lab4_5 driver.c lab4_5.o simple_io.o


proj4: driver.c proj4.o simple_io.o
	gcc -o proj4 driver.c proj4.o simple_io.o


proj4.o: proj4.asm simple_io.inc
	nasm -felf64 -o proj4.o proj4.asm

clean:
	rm *.o lab4_1 lab4_2 lab4_3 lab4_4 lab4_5
