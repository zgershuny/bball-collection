# bball-collection
Week 1 - Due 4/21/2021
Items Completed
  1. DDL File and uploaded to PHPMyAdmin
  2. DML File with SQL queries to be used 

Challenges Noted
  1. For the dim_features table, it may be better to code to calculate the sum with javascript and use that value to input or pull data

Next Steps
  Create web pages for
  1. home page
  2. collection page
  3. sales page
  4. search page

  Add features
  1. collection page
    A. render all cards in the collection
  2. sales page
    A. render the total sales in the collection
  3. search page 
    A. render the search results
    
Week 2 - Due 4/27/2021
Items Completed 
  1. collection page - renders all cards in the collection
  2. sales page - total sales in the collection
  3. homes page
  4. search page

Challenges
  1. UX - user experience design for search page- maybe combine it with the collection page

Next Steps
  1. implement a feature to update the card
  2. implement a feature to show the card's details
  3. implement a feature to update the sale
  4. implement a feature to delete the card
  5. determine what to do with the search page (as noted in the challenge section)

Week 3 - Due 5/4/2021
Items Completed
  1. Render a page that shows the card's details
  2. Render all the sales in the collection
  3. Update the sale for the individual card
  4. Delete the card
  5. Determined that the search page functionality is almost identical to add a new card. 
      Perhaps a same form can be designed with a button for the user to select to add or search

Challenges
  1. Cannot use one SQL query to update all card's details (as in updating multiple tables as once). 
      Will need to implement multiple queries
  2. Formatting is inconsistent on the card's details page. Will fix this at the end to beautify all pages

Next Steps
  1. Add a new card and its relevant information (and start working on search functionality here)
  2. Continue to work on updating the card's details
  3. Implement a feature to render slabs only or no slabs (collection/sales page)
  4. Implement a feature to render only sold and unsold cards (collection/sales page)

Week 4 - Due 5/10/2021

Items Completed
  1. Web page with form to add the card with prepopulated fields
  2. Implemented update the card's details
  3. display slabs or non slab cards (and both) for both collection and sales page

Challenges
  1. Implementing the script to update the card's details
  2. Implement the script to add a new card, maybe modify the approach by breaking it down

Next Steps
  1. Finish implementation of adding a new card - decide how to do it
  2. Implement to display players' and their cards (option for sold or unsold)
  3. Implement to display teams' and their cards (option for sold and unsold)
  4. Implement a feature to render only sold and unsold cards (collection/sales page) 

Week 5 - Due 5/17/2021

Items Completed
  1. Display players and/or teams and their cards (no option for sold or unsold - see challenges) and their possible combinatiosn. If not in system, direct to a new page to add a card
  2. render sold and unsold cards on collections and sales page
  3. Improved the database schema/tables to make adding a new card easier
  4. Added feature to add grading company, player, team, parallel, and effect

Challenges
  1. dynamic dropdown menu did not pass the value to render sold or unsold cards (i.e. I selected a player from the dropdown menu and then to see his sales, but the playerID wouldn't pass), led to a form and improved search with all the possible combinations of four fields (first name, last name, location, and team name)
  2. some entities/tables did not make sense when I was thinking about the logic of adding a card. Dim_Year was removed because that could go on a card and use DISTINCT SQL query and removed the associative entity for a M:M relationship (effect and parallel). Those two tables are still M:M through Fact_Card. Queries are updaated
  3. Some queries are extremely long for javascript files that make it difficult to read, but learned how to break them up with variables so it is easier to implement them. Moving forward, this method will be used. If time before class ends, this method will be implemented in the older files. See lookup.js as an example of utilizing the newer method.

Next Steps
  1. Finish implementing adding a new card
  2. Delete values in for tables except Card (card is done)
  3. add search by brand, series, parallel, effect, and grading
  4. Render the sales in the past month and week
