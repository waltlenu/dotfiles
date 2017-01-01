.PHONY: all bash dash ksh sh 

#OBJECTS := /dev/null
OBJECTS := bootstrap.sh

SHELLCHECK := docker run --rm -it -v $(CURDIR):/mnt nlknguyen/alpine-shellcheck

all: bash dash ksh sh

bash:
	@$(SHELLCHECK) -f gcc -s bash $(OBJECTS)

dash:
	@$(SHELLCHECK) -f gcc -s dash $(OBJECTS)

ksh:
	@$(SHELLCHECK) -f gcc -s ksh $(OBJECTS)

sh:
	@$(SHELLCHECK) -f gcc -s sh $(OBJECTS)

