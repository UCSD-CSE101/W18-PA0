// DO NOT MODIFY

#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <sstream>

#include "Graph.hpp"

template <class T>
bool checkVertex(std::list<T> l, T e){
    for(auto it = l.begin(); it != l.end(); it++){
        if((*it) == e){
            return true;
        }
    }
    return false;
}

// this reads in a graph from input stream to memory
template <class T>
int buildGraph(Graph<T>& g, std::ifstream& input) {
    if (input.is_open()) {
        std::string line;
        while (getline(input, line)) {
            std::stringstream in(line);
            T v1;
            in >> v1;
            T v2;
            in >> v2;
            if (g.vertices.count(v1) == 0) {
                g.vertices[v1] = new Vertex<T>(v1);
            }
            if (g.vertices.count(v2) == 0) {
                g.vertices[v2] = new Vertex<T>(v2);
            }
            if(!checkVertex(g.vertices[v1]->edges, v2)){
                g.vertices[v1]->edges.push_back(v2);
            }
        }
        input.close();
        return 1;
    }
    return 0;
}
