-- =========================================
-- RESEARCH QUESTION 1: 2026 ANALYSIS
-- =========================================


/* =========================================
   STEP 1: Winner Table (2026)
   ========================================= */

WITH constituency_winners AS (
    SELECT
        constituency,
        MAX(votes) AS highest_votes
    FROM tn_2026_results
    GROUP BY constituency
)

SELECT
    r.constituency,
    r.candidate,
    r.party,
    r.votes
FROM tn_2026_results r
JOIN constituency_winners cw
ON r.constituency = cw.constituency
AND r.votes = cw.highest_votes
ORDER BY r.votes DESC;


/* =========================================
   STEP 2: Party-wise Seat Distribution
   ========================================= */

WITH constituency_winners AS (
    SELECT
        constituency,
        MAX(votes) AS highest_votes
    FROM tn_2026_results
    GROUP BY constituency
)

SELECT
    r.party,
    COUNT(*) AS seats_won
FROM tn_2026_results r
JOIN constituency_winners cw
ON r.constituency = cw.constituency
AND r.votes = cw.highest_votes
GROUP BY r.party
ORDER BY seats_won DESC;


/* =========================================
   STEP 3: Regional Seat Distribution
   ========================================= */

WITH constituency_winners AS (
    SELECT
        constituency,
        MAX(votes) AS highest_votes
    FROM tn_2026_results
    GROUP BY constituency
)

SELECT
    r.region,
    r.party,
    COUNT(*) AS seats_won
FROM tn_2026_results r
JOIN constituency_winners cw
ON r.constituency = cw.constituency
AND r.votes = cw.highest_votes
GROUP BY r.region, r.party
ORDER BY r.region, seats_won DESC;
