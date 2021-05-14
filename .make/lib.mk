.PHONY: build
build: dirs $(_BUILDFOLDER)/lib/$(_LIB)

OBJ := $(addprefix $(_BUILDFOLDER)/obj/,$(_SRC:%.cpp=%.o))
DEPS := $(OBJ:.o=.d)

-include $(DEPS)

DIRS := $(sort $(subst $(_SRCFOLDER)/,,$(dir $(_SRC))))
.PHONY: dirs
dirs:
	@mkdir -p $(_BUILDFOLDER)/obj
	@mkdir -p $(_BUILDFOLDER)/lib
	@for i in $(DIRS); do mkdir -p $(_BUILDFOLDER)/obj/$$i; done;

$(_BUILDFOLDER)/lib/$(_LIB): $(OBJ) $(_DEPEND)
	@echo "$+ -> $@"
	@ar rcs $@ $(OBJ)

$(_BUILDFOLDER)/obj/%.o: $(_SRCFOLDER)/%.cpp
	@echo "$< -> $@ : $(_CFLAGS)"
	@$(_CC) $(_CFLAGS) -MMD -c $$PWD/$< -o $@

.PHONY: clean
clean:
	@echo "rm build/**"
	@rm -rf build/**
