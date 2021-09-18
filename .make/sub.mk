define MAKESUBDIR
@for i in $(SUBFOLDERS); do\
	let string_size=$${#i};\
	let remain=(50-string_size);\
	let even=remain%2;\
	[[ $$even -eq 0 ]] && let count_before=remain/2 || let count_before=remain/2+1;\
	let count_after=remain/2;\
	printf %"$$count_before"s | tr " " "-";\
	printf $$i;\
	printf %"$$count_after"s'\n' | tr " " "-";\
	$(MAKE) -C $$i $@ --no-print-directory || break;\
done;\

endef

.PHONY: all
all:
	$(MAKESUBDIR)

.PHONY: debug
debug:
	$(MAKESUBDIR)

.PHONY: release
release:
	$(MAKESUBDIR)

.PHONY: clean
clean:
	$(MAKESUBDIR)
