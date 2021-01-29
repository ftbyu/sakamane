up:
	docker-compose up -d
build:
	docker-compose build
bundle:
	docker-compose run web bundle update
	docker-compose build
	docker-compose up -d
	docker-compose exec web bundle exec rake db:create
stop:
	docker-compose stop
restart:
	docker-compose down
	docker-compose up 
	docker-compose exec web bundle exec rake db:create
down:
	docker-compose down
logs:
	docker-compose logs
ps:
	docker-compose ps
migrate:
	docker-compose exec web bundle exec rake db:migrate
create:
	docker-compose exec web bundle exec rake db:create
seed:
	docker-compose exec web bundle exec rake db:seed
