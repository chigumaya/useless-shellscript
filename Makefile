SUBDIRS= chapter4 cover omake

all: $(SUBDIRS)
.PHONY: all clean dockerimage $(SUBDIRS)
dockerimage:: Dockerfile
	docker build -t useless .
$(SUBDIRS):
	make -C $@
clean:
	for d in $(SUBDIRS); do make -C $$d clean; done
