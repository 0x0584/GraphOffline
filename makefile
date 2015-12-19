# Declaration of variables
CC = g++
CC_FLAGS = -std=c++0x -Wall -O3 -I ./algorithm -I ./pugixml -I ./report -I ./common -I ./graph -I . -DCGI_MODE

# File names
EXEC = ./bin/Linux/Release/GraphOffline
ALGORITHM_DIR = ./algorithm/
PUGIXML_DIR = ./algorithm/
REPORT_DIR = ./report/
COMMON_DIR = ./common/
GRAPH_DIR = ./graph/
OBJ_DIR = ./bin/Linux/obj/

SOURCES = $(wildcard *.cpp) $(wildcard */*.cpp)
# Create obejcts files in $(OBJ_DIR)
OBJECTS = $(patsubst %.cpp,$(OBJ_DIR)%.o, $(SOURCES))

# Main target
$(EXEC): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(EXEC)

# To obtain object files
$(OBJ_DIR)$(ALGORITHM_DIR)%.o: $(ALGORITHM_DIR)%.cpp
	$(CC) -c $(CC_FLAGS) $< -o $@

$(OBJ_DIR)$(PUGIXML_DIR)%.o: $(PUGIXML_DIR)%.cpp
	$(CC) -c $(CC_FLAGS) $< -o $@

$(OBJ_DIR)$(REPORT_DIR)%.o: $(REPORT_DIR)%.cpp
	$(CC) -c $(CC_FLAGS) $< -o $@

$(OBJ_DIR)$(COMMON_DIR)%.o: $(REPORT_DIR)%.cpp
	$(CC) -c $(CC_FLAGS) $< -o $@

$(OBJ_DIR)$(GRAPH_DIR)%.o: $(REPORT_DIR)%.cpp
	$(CC) -c $(CC_FLAGS) $< -o $@

$(OBJ_DIR)%.o: %.cpp
	$(CC) -c $(CC_FLAGS) $< -o $@

# To remove generated files
clean:
	rm -f $(EXEC) $(OBJECTS)

