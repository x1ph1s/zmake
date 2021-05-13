.PHONY: build
build: dirs $(_BUILDFOLDER)/lib/$(LIB)

OBJ := $(addprefix $(_BUILDFOLDER)/obj/,$(SRC:%.cpp=%.o))
DEPS := $(OBJ:.o=.d)

-include $(DEPS)

DIRS := $(sort $(subst $(SRCFOLDER)/,,$(dir $(SRC))))
.PHONY:dirs
dirs:
	@mkdir -p $(_BUILDFOLDER)/obj
	@mkdir -p $(_BUILDFOLDER)/lib
	@for i in $(DIRS); do mkdir -p $(_BUILDFOLDER)/obj/$$i; done;

$(_BUILDFOLDER)/lib/$(LIB): $(OBJ) $(_DEPEND)
	@echo "$+ -> $@"
	@ar rcs $@ $(OBJ)

$(_BUILDFOLDER)/obj/%.o: $(SRCFOLDER)/%.cpp
	@echo "$< -> $@ : $(_CFLAGS)"
	@$(CC) $(_CFLAGS) -MMD -c $$PWD/$< -o $@

.PHONY: clean
clean:
	@echo "rm build/**"
	@rm -rf build/**
