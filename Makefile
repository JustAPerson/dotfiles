install: install-neovim
clean: clean-neovim

DESTDIR ?= $(HOME)

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
