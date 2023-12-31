# IDEA EDU Course ...

Implemented in the Java <b>SQL for Backend Developers</b> Track of hyperskill.org's JetBrain Academy.<br>

Project goal is to exercise SQL, as I tend to forget its syntax quicker than any other programming language.
Also, translating ER-diagrams, creating triggers, views is not my usual daily work but helps me in the job still.

## Project status

Project was completed on 27.08.23.

## Repository Contents

Sources for all project tasks (5 stages).

## Progress

22.08.23 Project started. IDEA-setup and first repo, setting up `docker-compose.yml` for a docker MySQL-image.

22.08.23 Stage 1 completed. Translating the given ER-diagram of six relations-connected tables into a DDL.

22.08.23 Stage 2 completed. Inserting some basic data into the tables using `AFTER INSERT` trigger to keep an
inventory table in sync with sales. Add a clean script to be able to repeat all exercises.

23.08.23 Stage 3 completed. Create a composite index (which unfortunately does not help to solve the problem here).
Then create a view to group total sales on model. Query this view.

26.08.23 Stage 4 completed. Create an employee report only on Sales Assistants, that calculates the employee's monthly 
sales bonus based on their share in the monthly company revenue. Quite complex query - here saved as report view - using
`WITH` sub-selects, `CASE` statement and more.

27.08.23 Final Stage 5 completed. Create a model report - again saved as view - with some sales indicators as sales inventory ratio.