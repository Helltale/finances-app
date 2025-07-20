.PHONY: help generate build run clean install-tools

help:
	@echo "Available commands:"
	@echo "  gen     - Generate code from OpenAPI"
	@echo "  clean        - Clean generated files"


gen:
	go generate ./api

clean:
	rm -f internal/generated/*.go
	rm -rf bin/
