MINPAC_PATH = ./pack/minpac/opt/minpac

DEFAULT: update

$(MINPAC_PATH):
	git clone https://github.com/k-takata/minpac.git $(MINPAC_PATH)

.PHONY: update_minpac
update_minpac: $(MINPAC_PATH)
	cd $(MINPAC_PATH) && git pull

.PHONY: update_package
update_package: $(MINPAC_PATH)
	vim -c "call PackInit() | call minpac#update('', {'do': 'quitall'})"

.PHONY: update
update: update_minpac update_package




REPO_URL:=https://github.com/vim/vim.git
REPO_PATH:=vim-src
VIM_EXE:=${REPO_PATH}/src/vim
VIM_SRC:=$(wildcard ${REPO_PATH}/src/**/*)
VIM_CONFIG_FILE:=${REPO_PATH}/src/Makefile

${REPO_PATH}:
	git clone ${REPO_URL} ${REPO_PATH}

${VIM_EXE}: | ${REPO_PATH} ${VIM_SRC}
	cd ${REPO_PATH} && make

.PHONY: configure
configure:
	sed -i 's/#CONF_OPT_PYTHON3 = --enable-python3interp$$/CONF_OPT_PYTHON3 = --enable-python3interp/' ${VIM_CONFIG_FILE}
	sed -i 's/#CONF_OPT_LUA = --enable-luainterp$$/CONF_OPT_LUA = --enable-luainterp/' ${VIM_CONFIG_FILE}
	sed -i 's/#CONF_OPT_FAIL = --enable-fail-if-missing$$/CONF_OPT_FAIL = --enable-fail-if-missing/' ${VIM_CONFIG_FILE}

.PHONY: pull
pull: ${REPO_PATH}
	cd ${REPO_PATH} && make clean distclean && git checkout -f && git pull

.PHONY: build
build: | pull configure ${VIM_EXE}

.PHONY: install
install:
	cd ${REPO_PATH} && make install
