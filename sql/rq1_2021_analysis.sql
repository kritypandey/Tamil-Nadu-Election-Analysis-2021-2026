/* =========================================
   RESEARCH QUESTION 1
   Regional Power Shift Analysis (2021-2026)
   ========================================= */


/* =========================================
   STEP 1: Top 10 Candidates by Votes (2021)
   ========================================= */

SELECT *
FROM tn_2021_results
ORDER BY votes DESC
LIMIT 10;


/* =========================================
   STEP 2: Highest Votes in Each Constituency
   ========================================= */

SELECT
    constituency,
    MAX(votes) AS highest_votes
FROM tn_2021_results
GROUP BY constituency;


/* =========================================
   STEP 3: Top 10 Winning Constituencies
   ========================================= */

SELECT
    constituency,
    MAX(votes) AS highest_votes
FROM tn_2021_results
GROUP BY constituency
ORDER BY highest_votes DESC
LIMIT 10;


/* =========================================
   STEP 4: Winner Table (2021)
   ========================================= */

WITH constituency_winners AS (
    SELECT
        constituency,
        MAX(votes) AS highest_votes
    FROM tn_2021_results
    GROUP BY constituency
)

SELECT
    r.constituency,
    r.candidate,
    r.party,
    r.votes
FROM tn_2021_results r
JOIN constituency_winners cw
    ON r.constituency = cw.constituency
   AND r.votes = cw.highest_votes
ORDER BY r.votes DESC;


/* =========================================
   STEP 5: Party-wise Seat Distribution (2021)
   ========================================= */

WITH constituency_winners AS (
    SELECT
        constituency,
        MAX(votes) AS highest_votes
    FROM tn_2021_results
    GROUP BY constituency
)

SELECT
    r.party,
    COUNT(*) AS seats_won
FROM tn_2021_results r
JOIN constituency_winners cw
    ON r.constituency = cw.constituency
   AND r.votes = cw.highest_votes
GROUP BY r.party
ORDER BY seats_won DESC;


/* =========================================
   STEP 6: Regional Seat Distribution (2021)
   ========================================= */

WITH constituency_winners AS (
    SELECT
        constituency,
        MAX(votes) AS highest_votes
    FROM tn_2021_results
    GROUP BY constituency
)

SELECT
    r.region,
    r.party,
    COUNT(*) AS seats_won
FROM tn_2021_results r
JOIN constituency_winners cw
    ON r.constituency = cw.constituency
   AND r.votes = cw.highest_votes
GROUP BY r.region, r.party
ORDER BY r.region, seats_won DESC;
