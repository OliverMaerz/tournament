# tournament

A Python script to track a Swiss tournament. Requires Postgres and Python.

First create a database called "tournament" on Postgres. Next run the SQL from the `tournament.sql` file to create the tables and views that the script depends upon. Depending on your authentication settings in Postgres you also need to change the `connect()` function in the `tournament.py` file. 

Now run the `tournament_test.py` to see all the functions of the tournament.py in action. 
