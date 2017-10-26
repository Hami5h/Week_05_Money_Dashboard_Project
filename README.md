# Programming & Web Fundamentals

Over the next week you have the chance to consolidate and expand on everything you have learned:

- Ruby fundamentals
- TDD (where appropriate)
- OOP
- Web Programming ( REST/MVC )
- Databases with CRUD actions

## MoneyCashboard

You want to start tracking your spending in an attempt to be more frugal with money. You have decided to make a budgeting app to help you see where all of your money is being spent.

You must be able to create new Transactions ( which should include a merchant name, e.g. Tesco, and a value ) which have an associated Tag (e.g. 'food', 'clothes'). Your app would then be able to track a total, and display this in a view.

### MVP:

- Create new transactions
- Display a list of all transactions
- Display total amount spent
- Display total amount spent by tag

### Possible Extensions:

- CRUD actions for the transactions
- Show a warning when the total expenditure is over budget (set a hard coded budget first)
- Add a date to the transactions and view total spending by month
- Any other ideas you might come up with

## My Experience:

Started off by having a group planning session where we captured and discussed viable methods for completing the tasks.
User needs, class diagrams, and table diagrams were drawn on a whiteboard and we discussed the pros and cons of each suggested solution.
We ended up agreeing on creating three tables as follows:
1: Transactions,
2: Merchants,
3: Tags.
Models based on the above tables and associated methods were also agreed.

I started off by creating my directory structure, based on previous classroom and homework exercises. Once done I created my database and created my sql tables.
Following this I created the models and seeds files.
I had some problems with seeding the tables which was mostly down to typos.
By the end of the day I was able to display basic transaction information in my browser.

I then completed all the CRUD for the transactions model and verified functionality using psql in terminal and pry.
I then updated the transaction controller with the CRUD functions, and created the necessary forms in the 'erb' files. I had some problems with the transaction update form, since my tag table included an item name and item type, whereas my transaction model only included tag_id for inner joins. It was therefore not possible to update both the item name and the item type from the transaction update form.
This required me to reformat my tags and transactions tables.
Following this I eventually managed to create and update transactions.
I then decided it would be good to auto-populate the form with existing transaction data prior to updating. This caused me some problems when trying to do this for drop down items. I was shown a solution by one of the instructors.

I then created all the CRUD functions for the merchant and tag models. The functionality was then added to their respective controllers. Again, I had some minor hiccups due to typos, but I eventually managed to get all the information displaying and updating successfully in my browser.

##Setting up

- ‘brew install ruby’
- ‘gem install sinatra sinatra-contrib’
- Install Postgres on your machine.
- Clone/Download repository to a destination of your choice.
- Create dashboard database.
- Populate the tables/database by running the 'seeds.rb' file in terminal.
- Run the 'app.rb' file, and open your browser at 'localhost:4567'

## Design  

The design intent was to keep it as simple as possible and maintain accessibility.
A simple tabular layout with a comfortable colour scheme was chosen for all the pages.
A large font size was used where possible, along with row highlighting in the
tables.

## Outcome
The MVP was achieved, and a basic hard coded budget limit included. I therefore
achieved what I set out to do in this respect, but would've liked a bit more time to include additional features.
My main aim - as per project brief - was to consolidate all that I had been taught over the past few weeks, and gain a better understanding of Ruby and Databases. I feel that
over the course of the project, and by working through various problems, that my understanding has improved, and the goal has largely been met.

## Moving Forward

At some point, I would like to revisit this app and add a user table, which would allow for it to be personalised. E.g. This could include a user name and password functionality.
I would also like to revisit the extensions which I didn't have time to complete, and set a date for each transaction.
