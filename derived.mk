ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

THIS_DIR:=$(ROOT_DIR)/$(TARGET_FOLDER)

all: $(DEPENDENCY)
	cd $(THIS_DIR) && docker build -t $(TARGET) .

$(DEPENDENCY):
	$(MAKE) -C $(ROOT_DIR)/$(DEPENDENCY)

.PHONY: all $(DEPENDENCY)
