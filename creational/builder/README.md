# **Builder Design Patterns**

  ## **Articles**
  - http://coursegalaxy.com/design-patterns/builder.html
  - https://scoutapm.com/blog/rails-design-patterns
  - https://medium.com/kkempin/builder-design-pattern-in-ruby-dfa2d557ff1b

  ## **Where it is used**
    1. Used to create complex object in steps with representations.

    2. Same construction process can create different representations of a complex object

    3. Separate the construction process with the representation of an object

  ## **Example:**
  Let's say we want to create a user with the following arguments.
      `first_name`, `last_name`, `birthday`, `gender`, `roles`, `status`, `email`, `password`

  ## **What i have noticed**
  By using the builder design pattern, I have noticed the following :-
   - It is easier to test the object with only the wanted construction ie can test user auth with needing to pass birthday
   - It is easy to manage the default values of the incoming values