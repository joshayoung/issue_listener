# issue_listener

### Build the image:
* `docker build --tag issue-listener .`

### Run the image:
* `docker run -p 80:4567 --name issue-listener-container -it -v "$(pwd)":/app --rm issue-listener`
  * Make sure you are passing the '-it' flag or 'binding.pry' will not completely work.


**Note: This code is a working progress and needs to be refactored.**