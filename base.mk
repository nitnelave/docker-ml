ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

THIS_DIR:=$(ROOT_DIR)/$(TARGET_FOLDER)

all:
	cd $(THIS_DIR) && docker build -t $(TARGET) .

.PHONY: all
