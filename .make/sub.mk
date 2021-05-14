MAKESUBDIR = 																								\
	@for i in $(SUBFOLDERS); do 																		\
		echo -e "----------------------------------------\r-----------------$$i"; 		\
		$(MAKE) -C $$i $@ --no-print-directory || break; 										\
	done

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
