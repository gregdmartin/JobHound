# JobHound
(other title ideas welcome!)
Author: Greg Martin

## Project Description
The hunt for a job can be difficult. Some of the things that make it difficult:
* You may be dealing with many people at once, including recruiters, hiring managers, in-company contacts, etc.
* You are likely dealing with more than one company at once, and tracking what step you are in the process with them can be difficult.
* Related to above, keeping track of who owns the next action and what it is can be tough.
* It's easy to overload yourself or create double bookings if you can't easily visualize when things are scheduled.
* If a long period of time passes between interactions, it can be difficult to tell what the last step was.

The purpose of this project is to ease all of those problems by providing a simple interface that allows a person to create profiles for companies/recruitment resources, contacts associated with those, and job hunt 'events', which are scheduled actions that move the job hunting process forward with a company.

## Why This Project?
I found myself using Google Calendar and a spreadsheet in order to track information about my job hunt. It kept getting confusing because I had two different sets of data to keep in sync, and there wasn't a good way to look at previous actions. I decided that while I'm looking for my next job, I should solve my own problem using my skill set (software development). This will prove to be a fun project I can work on while I continue my search, and will hopefully become a good showcase of what I am capable of to others. Who knows, it might even be useful enough for someone to use!

# Running the application
## Database
For a first time setup locally you'll need to run a postgres DB. Currently this is simplified via Docker. Follow these instructions.
1. run `DB_ADMIN_PASS=$ADMIN_PASSWORD docker compose up -d db`. Choose a password for the _admin_ user of the DB, which is NOT the user that the application will use. This will create a container with postgres running in it, including a super user named `postgres` that has the password.
2. run `docker ps` and find the DB container. Under the `NAMES` column should be a generated name for the container. Take note of it for the next step (we'll reference it as $CONTAINER_NAME)
3. run `docker exec -it $CONTAINER_NAME bash`. This will start a bash session in the container.
  a. run `su - postgres`. This will set the current user to the `postgres` user, which has Super User permission on the DB.
  b. run `psql`. This will start a console-driven session against the DB.
    i. run `CREATE USER job_hound WITH CREATEDB PASSWORD '$PASSWORD'`. Choose a value for $PASSWORD and remember it for later. This value should be _different_ than what you chose for $ADMIN_PASSWORD. This will create a user that the application can run as.
  c. exit out of psql, your session as the postgres user, and your session with the container.
4. Add a new file at the root of the repository named `.env`. In it, add a single line that states `DB_PASS=$PASSWORD` (where the value is whatever you used). This file is already .gitignored, and should only be available on your local machine.
5. run `bundle exec rails db:create`. This will create the development and test databases using the user with the password.
5. run `RAILS_ENV=development bundle exec rails db:migrate`. This will add all the necessary tables and indexes and such to the `job_hound_development` database.
6. run `RAILS_ENV=test bundle exec rails db:migrate`. This will add all the necessary tables and indexes and such to the `job_hound_test` database.

You can bring the DB down using `docker compose down db`. You can access it by installing `psql` via `postgresql-client` and then running something like `psql -U jobhound -h localhost job_hound_development`. This will prompt for the $PASSWORD value.

If you find yourself using `psql` a fair bit, a good tip is to write an alias for your terminal. You can use a DB connection string like so:
`alias mydb="psql postgres://job_hound:$PASSWORD@localhost:5432/job_hound_development"`
Then you can type just the alias and not put in the password each time.

## Server
Assuming you did all the work above, you should just be able to run `bundle exec rails server` and then visit http://localhost:3000 to see the homepage.

# TODO
* Make DB setup easier (script user creation maybe?)
* use React for views