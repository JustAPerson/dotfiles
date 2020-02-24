DESTDIR ?= $(HOME)
TARGETS = neovim misc bin

print:
	@echo Plan to install: $(TARGETS)
install: install-dependencies $(addprefix install-,$(TARGETS))
uninstall: $(addprefix uninstall-,$(TARGETS))

PPAS =
DEPS =
PIPS =
install-dependencies:
	sudo apt-get install software-properties-common
	for PPA in $(PPAS); do \
		echo Installing ppa: $$PPA; \
		sudo add-apt-repository $$PPA; \
	done
	sudo apt-get update
	sudo apt-get install $(DEPS)
	pip3 install $(PIPS)

$(foreach TARGET,$(TARGETS),$(eval INSTALL_$(TARGET) := ""))

ifdef INSTALL_neovim
PPAS += ppa:neovim-ppa/unstable
DEPS += neovim
DEPS += xclip # clipboard support
DEPS += python-dev python-pip python3-dev python3-pip
PIPS += neovim
NVIMPATH ?= $(DESTDIR)/.config/nvim/
install-neovim:
	@echo "Installing neovim configuration"
	@mkdir -p $(NVIMPATH)
	@ln ./neovim/init.vim $(NVIMPATH)/init.vim
	@echo "Installing neovim plugins"
	@mkdir $(NVIMPATH)/autoload $(NVIMPATH)/plugged
	@ln ./neovim/plug.vim $(NVIMPATH)/autoload/plug.vim
	@nvim --headless -c PlugInstall -c quitall 2>/dev/null

uninstall-neovim:
	@echo "Removing neovim configuration and plugins"
	@rm -rf $(NVIMPATH)
endif

ifdef INSTALL_misc
MISCFILES = $(notdir $(wildcard misc/*))
install-misc:
	@for file in $(MISCFILES); do \
		ln ./misc/$$file $(DESTDIR)/$$file; \
	done
endif

ifdef INSTALL_bin
BINS ?= $(notdir $(wildcard bin/*))
BINPATH ?= $(DESTDIR)/.local/bin/
ifneq ($(filter scrot,$(BINS)),)
DEPS += scrot
endif
install-bin:
	@mkdir -p $(BINPATH)
	@for bin in $(BINS); do \
		echo Copying $$bin; \
		cp bin/$$bin $(BINPATH); \
	done

uninstall-bin:
	@for bin in $(BINS); do \
		echo Removing $$bin; \
		rm -f $(BINPATH)/$$bin; \
	done

check-bins:
	@for bin in $(BINS); do \
		echo Checking $$bin; \
		cmp bin/$$bin $(BINPATH)/$$bin; \
	done
	@echo All files are up to date
endif

ifdef INSTALL_awesome
AWESOMESCRIPTS ?= $(notdir $(wildcard awesome/*))
AWESOMEPATH ?= $(DESTDIR)/.config/awesome/
DEPS += awesome
install-awesome:
	@mkdir -p $(AWESOMEPATH)
	@for file in $(AWESOMESCRIPTS); do \
		ln awesome/$$file $(AWESOMEPATH)/$$file; \
	done
	@echo Must log out and set window manager

uninstall-awesome:
	@echo "Removing awesome configuration"
	@rm -rf $(AWESOMEPATH)
endif
