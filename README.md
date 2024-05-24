# Research Notes

## Config/Setup/Environment

- i'd like to cleanly separate the front-end from the backend here. I'm using Foreman to start both apps easily, and may run these as two docker containers (depending on how annoying that is).
  - docker compose in the root dir?

## Backend

- This will serve a namespaced API, but we're going to build it with a CSS/JS processor because admin tooling is always, always necessary. Worst case scenario, we can delete the files later.
- Initialization Command: `rails new savvy-tasks-backend -j importmaps -c sass -T`

  - I'm setting the admin app to use Importmaps because I like it, and there's no need to configure an interface for this task.
  - We aren't going to render CSS here, so I'm using SASS (again because I like it).
  - Database has to be postgresql
  - I use RSpec, so I'm skipping test_unit with -T.
  - git is initialized in the parent folder, but I'm including .gitignore and .gitattributes because those are helpful in app-specific folders.

- Initial Gems:
  - standardrb
  - rspec-rails
  - graphql-rb
  - devise

## Links

<https://sdrmike.medium.com/rails-7-api-only-app-with-devise-and-jwt-for-authentication-1397211fb97c>

## Frontend

- yarn: 3.8.2
- nodejs: 22.2.0
- install steps for yarn:

```!ruby

```

## Research Notes

- https://graphql-ruby.org/schema/object_identification.html

  - seems like we don't ever use integer IDs in GraphQL? that seems important here.
  - i think it means we're going to need to add some boilerplate to transform UUIDs into relational IDs?

    - https://github.com/rails/globalid

  - new column for tasks
