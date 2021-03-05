# issue_listener

### Build the image:
* `docker build --tag github_issues .`

### Run the image:
* `docker run -p 80:4567 --name github-issue-container -it -v "$(pwd)":/app --rm github_issues`
  * Make sure you are passing the '-it' flag or 'binding.pry' will not completely work.
