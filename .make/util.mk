PREFIX := $(lastword $(subst /, ,$(dir $(abspath $(firstword $(MAKEFILE_LIST))))))
MAKEFOLDER ?= .make

define link
__link_DEBUG := $$(subst %m,debug,$(1))
__link_RELEASE := $$(subst %m,release,$(1))
LDFLAGS := $(LDFLAGS) -l$(2)
DEBUGLDFLAGS := $$(DEBUGLDFLAGS) -L $$(__link_DEBUG)
RELEASELDFLAGS := $$(RELEASELDFLAGS) -L $$(__link_RELEASE)
DEBUGDEPEND := $$(DEBUGDEPEND) $$(__link_DEBUG)/lib$(2).a
RELEASEDEPEND := $$(RELEASEDEPEND) $$(__link_RELEASE)/lib$(2).a
undefine __link_DEBUG
undefine __link_RELEASE

endef
