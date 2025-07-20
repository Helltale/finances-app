.PHONY: help generate build run clean install-tools

help:
	@echo "Available commands:"
	@echo "  install-tools - Install development tools"
	@echo "  generate     - Generate code from OpenAPI"
	@echo "  build        - Build the application"
	@echo "  run          - Run the application"
	@echo "  clean        - Clean generated files"

install-tools:
	go install github.com/deepmap/oapi-codegen/cmd/oapi-codegen@latest

generate:
	cd api && go generate ./...

build: generate
	go build -o bin/server cmd/server/main.go

run: generate
	go run cmd/server/main.go

clean:
	rm -f internal/generated/*.go
	rm -rf bin/

test:
	go test ./...
