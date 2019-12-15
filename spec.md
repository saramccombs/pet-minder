# Specifications for the Sinatra Assessment

## Specs:

- [x] Use Sinatra to build the app

  - Gemfile contains Sinatra.
  - Used Sinatra to create MVC framework via the Corneal gem.

- [x] Use ActiveRecord for storing information in a database

  - Gemfile contains ActiveRecord.
  - Used SQLite3 gem in development phases, Heroku branch uses PG gem for deployment to Heroku.

- [x] Include more than one model class (e.g. User, Post, Category)

  - This project has three models: Account, Pet, and User.

- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)

  - The User model contains the relationship `has_many :pets`

- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)

  - The Pet model contains the relationship `belongs_to :User`
  - The User model contains the relationship `belongs_to :Account`

- [x] Include user accounts with unique login attribute (username or email)

  - The User model uses AR validation 
    - `validates :email, uniqueness: { case_sensitive: false }`
  - The Account model used AR validation 
    - `validates :username, presence: { message: "is required." }`
    - `validates :username, uniqueness: { case_sensitive: false, message: "is already taken, please try again." }`

- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

  - 

- [ ] Ensure that users can't modify content created by other users
- [ ] Include user input validations
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message

## Bonus or Extra Project Features

- [x] Other AR relationships
  - The Account model contains the relationship `has_one :User`
