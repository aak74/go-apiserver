#!/usr/bin/make

.DEFAULT_GOAL := build

build:
	go build -v ./cmd/apiserver

test:
	go test -v -race -timeout 30s ./...

up:
	docker-compose up -d

migrate-up:
	migrate -path migrations -database "postgres://user:password@localhost/restapi?sslmode=disable" up

migrate-down:
	migrate -path migrations -database "postgres://user:password@localhost/restapi?sslmode=disable" down

migrate-up-test:
	migrate -path migrations -database "postgres://user:password@localhost/restapi_test?sslmode=disable" up

migrate-down-test:
	migrate -path migrations -database "postgres://user:password@localhost/restapi_test?sslmode=disable" down