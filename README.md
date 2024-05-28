# Savvy Tasks

## Installation + Running

### Backend

1. Install ruby 3.2.3 (there's a tool-versions file in the root of the rails app)/
2. `bin/bundle install`.
3. `bin/rails db:create db:migrate db:seed`
4. Grab the user that received all the tasks (see db/seeds.rb), open a Rails console, and call `user.gid`.
  - You need to store that in an env var for the frontend. I promise I'll explain that in a moment.
5. `bin/rails s` to start the app.
6. GraphiQL is hosted at the app root

### Frontend:
1. Install yarn 3.
2. `yarn version set 3.8.2`
3. `yarn install`
4. Set `NEXT_PUBLIC_STATIC_USER_GID="the idea you pulled while setting up the backend"`
  - I use direnv to manage this, which is really nice. The command is `brew install direnv && vim .envrc`. Paste in there, then run direnv-allow. It'll load whatever ENV vars are defined for a specific directory + all children (until it hits another `.envrc` file)
5. `yarn dev`
6. App is alive at `localhost:3001`.

## Project Structure

### Back-End

This is a Rails 7 API running `graphql-rb` in a fairly standard setup. I aimed to standardize all of my input fields in order to make it simpler to use/understand the application. I nested all the query params inside of `taskInput` in order to ensure that all CRUD operations are manipulated using a consistent set of options. This helped when making sure that my payloads produced nice TypeScript objects. I'm also using GlobalID as my ID field in all queries to avoid exposing SQL IDs to the front-end and provide a little more separation between the front- and back-end. Because the instructions suggested a need to at least nod in the direction of security and performance, I also made two reasonable future-proofing moves while building my list view. The API is set up to provide pagination as data-sets grow, and I added the world's most basic devise install when I built out a user. I tried to assume that very basic features would be part of the roadmap, and to avoid over-complicating my Rails code.

Otherwise, this is very straightforward. Because GraphQL was new to me, I used a lot of the scaffolding code, but made sure to write integration tests for every query that we needed to handle. Because the app doesn't do much else, figuring out how to unit test the framework code didn't feel like a good use of my time. I did add some RSpec support tools and a few other little things, but again aimed to exercise the API and then leave it alone.

### Front-End
Rails was a no-brainer (both because that's my sweet spot and those were the instructions), but Javascript had more choices. I went with a Next.JS app living in an entirely separate project, because I wanted to make sure that the API and the front-end expressed a clear separation of concerns. I'm glad I did, because Next.JS ultimately wound up being a pretty great choice here. I used Next.JS 14, which introduced the Page router, and I really liked the way that I could seperate my server components from client components; Apollo has also released a React-Next.JS package that supports GraphQL queries in both modes, which I used here.

Structurally, there are two main components: a table listing all the tasks attached to a single user, and a form allowing the user to save/complete/delete a task. I broke the save, complete and delete actions off into their own buttons tied to isolated mutations. Save allows upserting to avoid requiring an entirely seperate UI route for edits when it's not necessary. This is kind of how Rails treats partials, and I like composing UI by changing the initial arguments passed into my rendering views. As long as it's not excessive, you can save a ton of time.

You'll likely note that there aren't any Jest tests here. I fully intended to add them, and ran out of time. This was a conscious choice; I'm a huge believer in testing and wasn't thrilled. If I had another day, that's how I'd spent it. I lost time because I went pretty deep into the typescript interface structure, and tried to make sure that all my functions received clear, explicit type markings. It's not a full replacement for good tests, but knowing that everything is strongly typed and not producing compiler warnings goes a long way towards making sure the app is fully working. The main interface is TaskI, which wraps all the data received from the API to control our req/res cycle effectively. This was an area where having standardized inputs was beneficial, as I could usually just cast the results object right into the correct type and pass it into my components.

Again, otherwise, this isn't reinventing the wheel. I aimed to avoid manipulating state, bloating my components and introducing too many extra concepts. I reached for Tailwind here, and I really liked how quickly it let me iterate on the UI.

### Reflection.

I had fun doing this, especially because I got to work with some new-to-me tools. I've been focused primarily on the backend in my last few jobs (because that's where the fires are), and appreciated the chance to dig into a full React/TS/Next/Tailwind app. I love learning, and any opportunity to look at new tools is a good one for me.

I also think there are some clear issues with the code as-is. On the backend, I didn't split up the input types for each mutation, and therefore could not mark specific arguments as required/optional when it would make more sense for that mutation. I'm not aware of a strong pattern suggested in the GraphQL guide, and kept all of my input types in the same file. I'm also not certain that it was the right call to add the User model. I could've accomplished something identical without it, and it front-loads complexity in the React app. I don't think that's a bad thing, necessarily, because a real-world iteration of this app would add users immediately, but it definitely increased the surface area for review. However, in a real PR, I can always cut out things like that and leave structures in place that make them easy to restore, and I find thinking a few steps ahead really helpful when designing software.

On the front-end, I felt good about the simplicity I reached. Tailwind was a huge help here, because it's very simple to add nice touches and strong layout. Absent a designer/product manager/stakeholder/person-that-needs-something-right-now-pleaaaase, I can sometimes tend towards adding UX polish that doesn't help the ticket get delivered. I think I avoided that here, but I'm concerned that it tilted too far in the other direction. I also really, really wish I had tests, but taking good advantage of Typescript was incredibly worthwhile and I never felt like I was completely off-base or cutting corners. I also know that the caching mechanism for Apollo/NextJS needs some investigation, because I'm absolutely not busting it and it's driving me a little nuts.

Overall, I felt like this was challenging me to keep things radically simple and streamlined without completely closing down the possibility for supporting complexity in the future, and I love writing that kind of code. I do this job because I like helping people and solving problems, and figuring out how to do smart, simple things fast is right in the sweet spot there.

I don't know how to end this reflection. Thanks for reading.
