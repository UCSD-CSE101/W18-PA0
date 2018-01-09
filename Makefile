BUILD = build

CXXFLAGS := -std=c++0x -I. $(CXXFLAGS)

TEST_SRCS       = testsrc/TestSuccessors.cpp testsrc/TestGraph.hpp
SUCCESSORS_SRCS  = Successors.cpp Graph.hpp Successors.hpp
PA_SRCS        = $(SUCCESSORS_SRCS) $(TEST_SRCS)

TestSuccessors: $(BUILD)/TestSuccessors

$(BUILD)/TestSuccessors : $(BUILD)/TestSuccessors.o $(BUILD)/Successors.o
	$(CXX) $(CXXFLAGS) $^ -o $@

$(BUILD)/TestSuccessors.o : $(TEST_SRCS) | $(BUILD)
	$(CXX) $(CXXFLAGS) -c $< -o $@
$(BUILD)/Successors.o : $(SUCCESSORS_SRCS) | $(BUILD)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(BUILD):
	mkdir $(BUILD)

clean:
	rm -rf build

turnin:
	tar -cvf PA0.tar *.cpp *.hpp
	turnin PA0.tar

.PHONY: all
