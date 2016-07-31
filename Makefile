install: install-git install-neovim
clean: clean-git clean-neovim

DESTDIR ?= $(HOME)

GITPATH ?= $(DESTDIR)
install-git:
	@echo "Installing git configuration"
	@ln ./git/gitconfig $(GITPATH)/.gitconfig

clean-git:
	@echo "Removing git configuration"
	@rm $(GITPATH)/.gitconfig

NVIMPATH ?= $(DESTDIR)/.config/nvim/
install-neovim:
	@echo "Installing neovim configuration"
	@mkdir -p $(NVIMPATH)
	@ln ./neovim/init.vim $(NVIMPATH)/init.vim
	@echo "Installing neovim plugins"
	@mkdir $(NVIMPATH)/autoload $(NVIMPATH)/plugged
	@ln ./neovim/plug.vim $(NVIMPATH)/autoload/plug.vim
	@nvim --headless -c PlugInstall -c quitall 2>/dev/null

clean-neovim:
	@echo "Removing neovim configuration and plugins"
	@rm -rf $(NVIMPATH)
