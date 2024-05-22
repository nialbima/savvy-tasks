# Research Notes

## Config/Setup/Environment

- i'd like to cleanly separate the front-end from the backend here. I'm using Foreman to start both apps easily, and may run these as two docker containers (depending on how annoying that is).
  - docker compose in the root dir?

## Backend

- This will serve a namespaced API, but we're going to build it with a CSS/JS processor because admin tooling is always, always necessary. Worst case scenario, we can delete the files later.
- Initialization Command: `rails new savvy-tasks-backend -j importmaps -c sass -T -r /Users/nabm/.asdf/shims/ruby `

  - I'm setting the admin app to use Importmaps because I like it, and there's no need to configure an interface for this task.
  - We aren't going to render CSS here, so I'm using SASS (again because I like it).
  - Database has to be postgresql
  - I use RSpec, so I'm skipping test_unit with -T.
  - git is initialized in the parent folder, but I'm including .gitignore and .gitattributes because those are helpful in app-specific folders.
  - I'm telling it to target the ASDF ruby shim so that it uses 3.2.3 when it sets up. I don't know whether it's necessary, I'm testing that out.

- Initial Gems:
  - standardrb
  - rspec-rails
  - graphql-rb
  - devise

## Links

https://sdrmike.medium.com/rails-7-api-only-app-with-devise-and-jwt-for-authentication-1397211fb97c

## Frontend
