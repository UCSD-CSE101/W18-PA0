# CSE 101 PA 0 Makefile
#
# DO NOT MODIFY

CC=g++
FLAGS=-std=c++0x -I./

HEADERS=$(wildcard *.hpp)
SOURCES=$(wildcard *.cpp)
OBJECTS=$(SOURCES:.cpp=.o)

TestSuccessors.o: testsrc/TestSuccessors.cpp $(HEADERS)
	$(CC) -I testsrc/ $(FLAGS) -g -c testsrc/TestSuccessors.cpp

TestSuccessors: TestSuccessors.o Successors.o
	$(CC) $(FLAGS) -g -o TestSuccessors.out TestSuccessors.o Successors.o

%.o: %.cpp
	$(CC) $(FLAGS) -g -c -o $@ $<

clean:
	rm -f *.o
	rm -f *.out
