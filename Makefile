test:
	mix test

runserver:
	mix phoenix.server

install_deps:
	mix deps

.PHONY: test runserver install_deps
