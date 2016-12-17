# tournament

A Python script to track a Swiss tournament. Requires Postgres and Python.

First create a database called "tournament" and tables and views in Postgres  `psql -f tournament.sql`. Depending on your authentication settings in Postgres you also need to change the `connect()` function in the `tournament.py` file. 

Now run the `tournament_test.py` to see all the functions of the tournament.py in action. 
