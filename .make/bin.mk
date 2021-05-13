.PHONY: build
build: dirs $(_BUILDFOLDER)/bin/$(BIN)

OBJ := $(addprefix $(_BUILDFOLDER)/obj/,$(SRC:%.cpp=%.o))
DEPS := $(OBJ:.o=.d)

-include $(DEPS)

DIRS := $(sort $(subst $(SRCFOLDER)/,,$(dir $(SRC))))
.PHONY: dirs
dirs:
	@mkdir -p $(_BUILDFOLDER)/bin
	@mkdir -p $(_BUILDFOLDER)/obj
	@for i in $(DIRS); do mkdir -p $(_BUILDFOLDER)/obj/$$i; done;

$(_BUILDFOLDER)/bin/$(BIN): $(OBJ) $(_DEPEND)
	@echo "$(OBJ) -> $@ : $(_LDFLAGS)"
	@$(CC) $(OBJ) -o $@ $(_LDFLAGS)

$(_BUILDFOLDER)/obj/%.o: $(SRCFOLDER)/%.cpp
	@echo "$< -> $@ : $(_CFLAGS)"
	@$(CC) $(_CFLAGS) -MMD -c $$PWD/$< -o $@

.PHONY: clean
clean:
	@echo "rm build/**"
	@rm -rf build/**
