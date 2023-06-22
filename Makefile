.DEFAULT_GOAL := help

build: ## build develoment environment
	if ! [ -f .env ];then cp .env.example .env;fi
	docker compose build
	docker compose run --rm app bundle install
	docker compose run --rm app npm install
	docker compose run --rm app bin/webpack
	docker compose run --rm app bin/rails assets:precompile
	docker compose run --rm app bin/rails db:create db:migrate db:seed

serve: ## Run Server
	docker compose up rails

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
