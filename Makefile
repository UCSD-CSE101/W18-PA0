# CSE 101 PA 1 Makefile
#
# DO NOT MODIFY

CC=g++
FLAGS=-std=c++0x -I./

HEADERS=$(wildcard *.hpp)
SOURCES=$(wildcard *.cpp)
OBJECTS=$(SOURCES:.cpp=.o)

TestNeighbors.o: testsrc/TestNeighbors.cpp $(HEADERS)
	$(CC) -I testsrc/ $(FLAGS) -g -c testsrc/TestNeighbors.cpp

TestNeighbors: TestNeighbors.o Neighbors.o
	$(CC) $(FLAGS) -g -o TestNeighbors.out TestNeighbors.o Neighbors.o

%.o: %.cpp
	$(CC) $(FLAGS) -g -c -o $@ $<

clean:
	rm -f *.o
	rm -f *.out
