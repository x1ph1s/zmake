.PHONY: all
all: debug

include $(MAKEFOLDER)/target.mk

$(eval $(call default,debug,DEBUG))
$(eval $(call default,release,RELEASE))
