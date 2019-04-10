install: brew fish tmux git vscode


brew:
	@command -v brew > /dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

fish: brew
	@rm -r $(HOME)/.config/fish
	@ln -s $(CURDIR)/fish $(HOME)/.config/fish

tmux: brew
	@rm -f $(HOME)/.tmux.conf
	@ln -s $(CURDIR)/tmux/tmux.conf $(HOME)/.tmux.conf

git: brew
	@rm -f $(HOME)/.gitconfig
	@ln -s $(CURDIR)/git/gitconfig $(HOME)/.gitconfig

VSCODE = "$(HOME)/Library/Application Support/Code/User"
vscode: brew ## Visual Studio Code -- text editor from Microsoft // https://code.visualstudio.com/docs/setup/mac
	@rm -f ${VSCODE}/keybindings.json ${VSCODE}/locale.json ${VSCODE}/settings.json
	@ln -s $(CURDIR)/vscode/keybindings.json ${VSCODE}/keybindings.json
	@ln -s $(CURDIR)/vscode/locale.json ${VSCODE}/locale.json
	@ln -s $(CURDIR)/vscode/settings.json ${VSCODE}/settings.json

