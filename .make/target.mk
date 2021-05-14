.PHONY: make
make: export _CC = $(CC)
make: export _BIN = $(BIN)
make: export _LIB = $(LIB)
make: export _SRC = $(SRC)
make: export _SRCFOLDER = $(SRCFOLDER)
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
