.PHONY: ssh-keygen clean-vim-tmp

ssh-keygen:
	ssh-keygen -t ed25519 -C '908409+trotttrotttrott@users.noreply.github.com'

clean-vim-tmp:
	find ./.vim/tmp/ -maxdepth 1 -type f ! -name ".keep" -delete
