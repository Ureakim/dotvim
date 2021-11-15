MINPAC_PATH = ./pack/minpac/opt/minpac

DEFAULT: update

$(MINPAC_PATH):
	git clone https://github.com/k-takata/minpac.git $(MINPAC_PATH)

.PHONY: update_minpac
update_minpac: $(MINPAC_PATH)
	cd $(MINPAC_PATH) && git pull

.PHONY: update_package
update_package: $(MINPAC_PATH)
	vim -c "call minpac#update('', {'do': 'quitall'})"

.PHONY: update
update: update_minpac update_package
