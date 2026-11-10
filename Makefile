-include .env

MIGRATE_DIR ?= ./migrations

mc:
	migrate create -ext sql -dir $(MIGRATE_DIR) -seq $(name) 