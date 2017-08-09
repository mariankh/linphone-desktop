
targets=desktop

.PHONY: all

all: build

build: $(addsuffix -build, $(targets))


desktop: desktop-build

desktop-build:
	$(MAKE) -C WORK/desktop/cmake/
	@echo "Done"


pull-transifex:
	$(MAKE) -C linphone pull-transifex

push-transifex:
	$(MAKE) -C linphone push-transifex

help-prepare-options:
	@echo "prepare.py was previously executed with the following options:"
	@echo "   ./prepare.py "

help: help-prepare-options
	@echo ""
	@echo "(please read the README.md file first)"
	@echo ""
	@echo "Available targets: desktop"
	@echo ""
