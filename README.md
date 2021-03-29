# issue_listener

### Build the image:
* `docker build --tag issues-dashboard .`

### Run the image:
* `docker run -p 80:4567 --name issues-dashboard-container -it -v "$(pwd)":/app --rm issues-dashboard`
  * Make sure you are passing the '-it' flag or 'binding.pry' will not completely work.


### Run with Docker Compose:
* `docker-compose up --build`

### Run with Docker Compose in development mode:
* `docker-compose run --service-ports --entrypoint "rerun 'bundle exec rackup --host 0.0.0.0 -p 4567'" app`
**Note: This code is a working progress and needs to be refactored.**