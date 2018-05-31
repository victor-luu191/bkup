#!/bin/bash

source utils.sh

e_header "Installations"
# install brew
if type_exists 'brew'; then
	e_success "brew already installed"
else
	echo "Installing Homebrew..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install zsh
if type_exists 'zsh'; then
	e_success "zsh already installed"
else
	echo "Installing zsh..."
	brew install zsh
fi

# if type_exists 'oh-my-zsh'; then
# 	e_success "oh-my-zsh already installed"
# else
# 	echo "Installing oh-my-zsh..."
# 	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# fi

if type_exists 'wget'; then
	e_success "wget already installed"
else
	echo "Installing wget..."
	brew install wget
fi

if type_exists 'tree'; then
	e_success "tree already installed"
else
	e_warning "tree not installed!"
	seek_confirmation "Do you want to install it?"
	if is_confirmed; then
		brew install tree
	fi
fi

if type_exists 'cask'; then
	e_success "cask already installed"
else
	brew install cask 
fi

if type_exists 'awscli'; then
	e_success "AWS CLI installed"
else
	brew install awscli
fi

# installation need confirmation
seek_confirmation "Install pyenv to manage python environments?"
if is_confirmed; then
	brew install pyenv
else
	e_arrow "Nothing installed"
fi

seek_confirmation "Install silver searcher, a quick and dirty way to search through any file structure for a key word or phrase? Use common flag --context to print out the lines before and after the key phrase."
if is_confirmed; then
	brew install the_silver_searcher
else
	e_arrow "Nothing installed"
fi