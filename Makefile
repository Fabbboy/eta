PROJECT := eta

CWD := $(shell pwd)
SRC_DIR := $(CWD)/$(PROJECT)
OUT_DIR := $(CWD)/out

TARGET := $(OUT_DIR)/$(PROJECT).exe

SOURCES := \
	$(SRC_DIR)/main.c

OBJECTS := $(SOURCES:$(SRC_DIR)/%.c=$(OUT_DIR)/%.o)

CC ?= clang
CC_FLAGS := -I$(SRC_DIR) -g 

MKDIR := mkdir -p
RM := rm -rf

ifeq ($(V),1)
Q =
else
Q = @
endif

.PHONY: prepare build clean run all

all: build

prepare:
	$(Q)$(MKDIR) $(OUT_DIR)

build: prepare $(TARGET)

$(TARGET): $(OBJECTS)
	@echo "	LD	$@"
	$(Q)$(CC) $(CC_FLAGS) -o $@ $^

$(OUT_DIR)/%.o: $(SRC_DIR)/%.c
	@echo "	CC	$@"
	$(Q)$(CC) $(CC_FLAGS) -c $< -o $@

clean:
	@echo "	CLEAN	$(OUT_DIR)"
	$(Q)$(RM) $(OUT_DIR)

run: build
	$(Q)$(TARGET)

all: build

