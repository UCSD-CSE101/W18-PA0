// Tester for PA0 Successors
// 
// DO NOT MODIFY

#include <list>
#include "TestGraph.hpp"
#include "Successors.hpp"

int main(int argc, char * argv[]) {
    if (argc != 2) {
        std::cerr << "Invalid number of arguments; expecting 1 for file name"
                  << std::endl;
        exit(1);
    }

    std::ifstream input (argv[1], std::ios::in);

    int v;
    Graph<int> g;
    input >> v;

    if (!buildGraph(g, input)) {
        std::cerr << "Unable to build graph, please check graph format"
                  << std::endl;
        exit(1);
    }

    std::list<int> successorList = successors(g, v);
    std::cout << "Successors:" << std::endl;
    for(auto it = successorList.begin(); it != successorList.end(); it++){
      std::cout << " " << *it;
    }

    return 0;
}
