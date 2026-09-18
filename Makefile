SUBDIRS= chapter4 cover omake

.PHONY: all $(SUBDIRS)
all: $(SUBDIRS)
$(SUBDIRS):
	make -C $@
