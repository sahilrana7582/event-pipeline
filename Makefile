# Directory where database migration files are stored
MIGRATE_DIR ?= ./migrations


# Create a new sequential SQL migration
# Usage: make mc name=create_events
mc:
	migrate create -ext sql -dir $(MIGRATE_DIR) -seq $(name)


# Start all Docker Compose services in detached mode
dup:
	docker compose -f DockerCompose.yaml up -d


# Stop all running Docker Compose services
dd:
	docker compose -f DockerCompose.yaml down


# Stop services and remove associated volumes (deletes persisted data)
ddv:
	docker compose -f DockerCompose.yaml down -v


# Create a local Git commit
# Usage: make gc -mg="feat: add event pipeline"
gc:
	@test -n "$(msg)" || (echo 'Usage: make gc msg="commit message"'; exit 1)
	git add .
	git commit -m "$(msg)"


# Push commits to the remote repository
gp:
	git push
