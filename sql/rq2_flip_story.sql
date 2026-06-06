-- =========================================
-- RESEARCH QUESTION 2
-- THE FLIP STORY
-- =========================================

-- Business Question:
-- In how many constituencies did the winning party change
-- between 2021 and 2026?
--
-- What was the most common party-to-party transition?
-- Which constituencies experienced the largest flips?


-- =========================================
-- QUERY 1: WINNER COMPARISON
-- Compare constituency winners in 2021 vs 2026
-- =========================================

WITH winners_2021 AS (
    SELECT
        constituency,
        party
    FROM tn_2021_results r
    WHERE votes = (
        SELECT MAX(votes)
        FROM tn_2021_results
        WHERE constituency = r.constituency
    )
),

winners_2026 AS (
    SELECT
        constituency,
        party
    FROM tn_2026_results r
    WHERE votes = (
        SELECT MAX(votes)
        FROM tn_2026_results
        WHERE constituency = r.constituency
    )
)

SELECT
    w21.constituency,
    w21.party AS winner_2021,
    w26.party AS winner_2026,
    CASE
        WHEN w21.party = w26.party THEN 'Retained'
        ELSE 'Flipped'
    END AS seat_status
FROM winners_2021 w21
JOIN winners_2026 w26
ON w21.constituency = w26.constituency
ORDER BY seat_status DESC, constituency;


-- =========================================
-- QUERY 2: FLIPPED VS RETAINED COUNT
-- Count constituencies that changed winners
-- =========================================

WITH winners_2021 AS (
    SELECT constituency, party
    FROM tn_2021_results r
    WHERE votes = (
        SELECT MAX(votes)
        FROM tn_2021_results
        WHERE constituency = r.constituency
    )
),

winners_2026 AS (
    SELECT constituency, party
    FROM tn_2026_results r
    WHERE votes = (
        SELECT MAX(votes)
        FROM tn_2026_results
        WHERE constituency = r.constituency
    )
),

comparison AS (
    SELECT
        w21.constituency,
        w21.party AS winner_2021,
        w26.party AS winner_2026,
        CASE
            WHEN w21.party = w26.party THEN 'Retained'
            ELSE 'Flipped'
        END AS seat_status
    FROM winners_2021 w21
    JOIN winners_2026 w26
    ON w21.constituency = w26.constituency
)

SELECT
    seat_status,
    COUNT(*) AS constituencies
FROM comparison
GROUP BY seat_status;


-- =========================================
-- QUERY 3: PARTY TRANSITION MATRIX
-- Identify major constituency shifts
-- =========================================

WITH winners_2021 AS (
    SELECT constituency, party
    FROM tn_2021_results r
    WHERE votes = (
        SELECT MAX(votes)
        FROM tn_2021_results
        WHERE constituency = r.constituency
    )
),

winners_2026 AS (
    SELECT constituency, party
    FROM tn_2026_results r
    WHERE votes = (
        SELECT MAX(votes)
        FROM tn_2026_results
        WHERE constituency = r.constituency
    )
)

SELECT
    w21.party AS party_2021,
    w26.party AS party_2026,
    COUNT(*) AS constituencies
FROM winners_2021 w21
JOIN winners_2026 w26
ON w21.constituency = w26.constituency
WHERE w21.party <> w26.party
GROUP BY w21.party, w26.party
ORDER BY constituencies DESC;


-- =========================================
-- QUERY 4: TOP 10 FLIPPED CONSTITUENCIES
-- Highest-vote flipped constituencies
-- =========================================

WITH winners_2021 AS (
    SELECT constituency, party
    FROM tn_2021_results r
    WHERE votes = (
        SELECT MAX(votes)
        FROM tn_2021_results
        WHERE constituency = r.constituency
    )
),

winners_2026 AS (
    SELECT
        constituency,
        candidate,
        party,
        votes
    FROM tn_2026_results r
    WHERE votes = (
        SELECT MAX(votes)
        FROM tn_2026_results
        WHERE constituency = r.constituency
    )
)

SELECT
    w26.constituency,
    w21.party AS party_2021,
    w26.party AS party_2026,
    w26.candidate,
    w26.votes
FROM winners_2021 w21
JOIN winners_2026 w26
ON w21.constituency = w26.constituency
WHERE w21.party <> w26.party
ORDER BY w26.votes DESC
LIMIT 10;


-- =========================================
-- QUERY 5: SANKEY DATASET
-- Source → Target → Value
-- Used for Sankey Diagram Visualization
-- =========================================

WITH winners_2021 AS (
    SELECT constituency, party
    FROM tn_2021_results r
    WHERE votes = (
        SELECT MAX(votes)
        FROM tn_2021_results
        WHERE constituency = r.constituency
    )
),

winners_2026 AS (
    SELECT constituency, party
    FROM tn_2026_results r
    WHERE votes = (
        SELECT MAX(votes)
        FROM tn_2026_results
        WHERE constituency = r.constituency
    )
)

SELECT
    w21.party AS source,
    w26.party AS target,
    COUNT(*) AS value
FROM winners_2021 w21
JOIN winners_2026 w26
ON w21.constituency = w26.constituency
GROUP BY source, target
ORDER BY value DESC;
