# job-hunt-tracker
Job Hunt Tracker, a CRM for those on the lookout for a job

[![Ruby](https://github.com/mtantawy/job-hunt-tracker/actions/workflows/ruby.yml/badge.svg)](https://github.com/mtantawy/job-hunt-tracker/actions/workflows/ruby.yml)

Simple Rails app to track job applications and interviews.
It starts with an `Opportunity` which is used to track the source as well as basic info about the company and the job.

Each `Opportunity` can have many `Contacts` which is used to track recruiters, hiring managers, etc ...

Each `Opportunity` also has many `Process Steps` which is used to track the progress of the application process.

`Opportunities` and `Process Steps` have a `state` attribute to track prgress.

All models have a `notes` attribute to track any additional info in freetext style.

While there is a `User` model, the app is not yet multi-user ready, it is meant to be used by a single user.

## Future plans
* Search all models functionality.
* Re-imagine the homepage to be more of a dashboard than a listing of Opportunities sorted by date.
* Make the homepage more actionable, by highlighting somehow the Opportunities that need attention/action.
* (Idea by Copilot!) Add a `Tasks` model to track todos, and link them to Opportunities and Process Steps.
* Add a model to track compensation and benefits, and grade Opportunities to help with decision making.
* Add notifications that act as a tasks list to remind the user to take action regarding pending Opportunities for example or to follow up on an interview.

## Setup
> source: https://github.com/rails/rails/blob/main/railties/CHANGELOG.md

Dockerfile and docker-compose.yml are provided for easy setup, follow either one of the following guides.

### Docker Setup
`docker build -t job-hunt-tracker .`

`docker volume create job-hunt-tracker-storage`

`docker run --rm -d -v job-hunt-tracker-storage:/rails/storage -p 3000:3000 --env RAILS_MASTER_KEY=<see config/master.key> job-hunt-tracker`


### Docker Compose Setup
`export RAILS_MASTER_KEY=<see config/master.key>`

Confirm with `env | grep -i RAILS_MASTER_KEY`

`docker-compose up -d` OR `docker compose up -d` depending on the `docker-compose` version.

This will build the image and run the container in detached mode.

For newer versions, an image needs to be rebuilt, container(s) stopped, and restarted using something along the lines of

`docker compose build app && docker compose down && docker compose up -d`

### Create user for login
`docker-compose exec -it app bash`

`bin/rails c`

`User.create!(email: "email@example.com", password: "123456")`

### I don't have access to the master.key, what do I do?
So far, there is nothing special stored in the excrypted credentials file, so you can safely regenerate the master.key and credentials.yml.enc files.

The easiest way is by running `bin/rails credentials:edit` and saving the file. (might need to delete the existing credentials.yml.enc file first)
#### What if I don't have access to rails command?
You can run `rails` as a docker container, but you will need to mount the app directory as a volume

`docker run --rm -it -v ${PWD}:/rails ghcr.io/rails/cli bash`

Install dependencies with `bundle install`

Delete existing encrypted credentials `rm config/credentials.yml.enc`

Generate new master.key and credentials.yml.enc `EDITOR=vim bin/rails credentials:edit`

Then follow Docker Setup or Docker Compose Setup above, remember to export the env variable `RAILS_MASTER_KEY`.

Do you know a better way of doing this? Please let me know!

### (Optional) Create sample data
Uncomment the code in `db/seeds.rb` and run `bin/rails db:seed`

Running `db:seed` might not be needed if code was uncommented before building and running the app for the first time as the seed will be run automatically along with the `db:setup` task triggered by `db:prepare` triggered by `bin/docker-entrypoint`.
