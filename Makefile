
# params
CXX=g++
CXXFLAGS= -std=c++11

# defs
# app  = every .cpp except test files
APP_SRCS  = $(filter-out tests.cpp %_test.cpp,$(wildcard *.cpp))
APP_OBJS  = $(APP_SRCS:%.cpp=bin/%.o)

# test = test files + app code minus main.cpp
TEST_SRCS = $(wildcard tests.cpp *_test.cpp) $(filter-out main.cpp,$(APP_SRCS))
TEST_OBJS = $(TEST_SRCS:%.cpp=bin/%.o)

.PHONY: run test clean

# commands
bin/app: $(APP_OBJS)
	$(CXX) $^ -o $@

bin/test: $(TEST_OBJS)
	$(CXX) $^ -o $@

test: bin/test
	./bin/test

run: bin/app
	./bin/app

bin/%.o: %.cpp | bin
	$(CXX) $(CXXFLAGS) -c $< -o $@

# dirs
bin:
	mkdir -p bin

# commands
clean:
	rm -rf bin
