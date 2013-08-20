# RailsCasts Example Application

Run these commands to try it out.

```
bundle
rake db:setup
rails s
```

Requires Ruby 1.9.2 or later to run.

Note
====

Security wise, I implemented features without looking at who could access it. So a user could very well modify tasks he
doesn't own.

I would have probably implemented Cancan at this point to manage permissions (https://github.com/ryanb/cancan).

Everything is tested using rspec/capybara. So the tests are pretty slow, but it's covering most of what was asked.

I'm sure there is a lot which can be improved performance-wise (usage of database cleaner, factory girl, etc.).

Also, I didn't implement deletion of followers. (You will have to delete it manually)
