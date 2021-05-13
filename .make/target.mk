.PHONY: make
make: export _CFLAGS = $(CFLAGS)
make: export _LDFLAGS = $(LDFLAGS)
make: export _DEPEND = $(DEPEND)
make: export _BUILDFOLDER = $(BUILDFOLDER)
make:
	@$(MAKE) build --no-print-directory

define default
.PHONY: $(1)
$(1): CFLAGS += $$($(2)CFLAGS)
$(1): LDFLAGS += $$($(2)LDFLAGS)
$(1): DEPEND += $$($(2)DEPEND)
$(1): BUILDFOLDER := $$(BUILDFOLDER)/$(1)
$(1): make
endef
