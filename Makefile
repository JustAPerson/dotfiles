install: install-git install-neovim install-misc install-bin
uninstall: uninstall-git uninstall-neovim uninstall-bin

DESTDIR ?= $(HOME)
PPAS =
DEPS =

install-dependencies:
	sudo apt-get install software-properties-common
	$(foreach PPA, $(PPAS), sudo add-apt-repository $(PPA))
	sudo apt-get update
	sudo apt-get install $(DEPS)
	pip3 install neovim


DEPS += git
GITPATH ?= $(DESTDIR)
install-git:
	@echo "Installing git configuration"
	@ln ./git/gitconfig $(GITPATH)/.gitconfig

uninstall-git:
	@echo "Removing git configuration"
	@rm $(GITPATH)/.gitconfig

PPAS += ppa:neovim-ppa/unstable
DEPS += neovim
DEPS += xclip # clipboard support
DEPS += python-dev python-pip python3-dev python3-pip
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

# TODO figure out Makefile loops
install-misc:
	@ln ./misc/.todotxt-machinerc $(DESTDIR)/.todotxt-machinerc

BINS = $(notdir $(wildcard bin/*))
BINPATH ?= $(DESTDIR)/.local/bin/
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
