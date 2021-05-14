.PHONY: build
build: dirs $(_BUILDFOLDER)/bin/$(_BIN)

OBJ := $(addprefix $(_BUILDFOLDER)/obj/,$(_SRC:%.cpp=%.o))
DEPS := $(OBJ:.o=.d)

-include $(DEPS)

DIRS := $(sort $(subst $(_SRCFOLDER)/,,$(dir $(_SRC))))
.PHONY: dirs
dirs:
	@mkdir -p $(_BUILDFOLDER)/bin
	@mkdir -p $(_BUILDFOLDER)/obj
	@for i in $(DIRS); do mkdir -p $(_BUILDFOLDER)/obj/$$i; done;

$(_BUILDFOLDER)/bin/$(_BIN): $(OBJ) $(_DEPEND)
	@echo "$(OBJ) -> $@ : $(_LDFLAGS)"
	@$(_CC) $(OBJ) -o $@ $(_LDFLAGS)

$(_BUILDFOLDER)/obj/%.o: $(_SRCFOLDER)/%.cpp
	@echo "$< -> $@ : $(_CFLAGS)"
	@$(_CC) $(_CFLAGS) -MMD -c $$PWD/$< -o $@

.PHONY: clean
clean:
	@echo "rm build/**"
	@rm -rf build/**
