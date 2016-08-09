THEME = themes/purehugo
THEME_GIT = https://github.com/toru-mano/purehugo

all: deploy

deploy: 
	./scripts/build.sh https://kiranbot.com kiranbotblog

demo:
	hugo serve

certificates:
	$(HOME)/github/letsencrypt.sh/letsencrypt.sh -c -f letsencrypt-config.sh

# File rules

letsencrypt.sh:
	$(HOME)/github/letsencrypt.sh/letsencrypt.sh

certs:
	mkdir -p certs

.PHONY: phony all certificates demo