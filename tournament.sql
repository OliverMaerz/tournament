-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.



-- teams table

CREATE TABLE "teams" (
    "team_id" serial PRIMARY KEY,
    "team_name" text NOT NULL
);


-- matches table

CREATE TABLE "matches" (
    "match_id" serial PRIMARY KEY,
    "winner" int NOT NULL REFERENCES "teams"("team_id") ON DELETE CASCADE,
    "loser" int NOT NULL REFERENCES "teams"("team_id") ON DELETE CASCADE
);


-- winners view - view showing teams sorted by win (includes wins column)

CREATE VIEW winners AS
    SELECT team_id, team_name FROM
        (SELECT teams.team_id, teams.team_name,
            (SELECT COUNT(*) FROM matches WHERE matches.winner = teams.team_id)
         AS wins FROM teams ORDER BY wins DESC) AS results


-- team details view - shows teams with wins and number of matches

CREATE VIEW team_details AS SELECT teams.team_id, teams.team_name,(
    SELECT COUNT(*) FROM matches
        WHERE matches.winner = teams.team_id) AS wins,(
            SELECT COUNT(*) FROM matches
                WHERE matches.loser = teams.team_id
                OR matches.winner = teams.team_id) AS matches
        FROM teams