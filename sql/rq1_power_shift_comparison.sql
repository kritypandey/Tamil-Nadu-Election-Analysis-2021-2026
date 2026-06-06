-- =========================================
-- RESEARCH QUESTION 1
-- REGIONAL POWER SHIFT COMPARISON
-- =========================================

-- Business Question:
-- How did seat distribution shift across Tamil Nadu's regions
-- between the 2021 and 2026 Assembly Elections?

WITH winners_2021 AS (
    SELECT
        r.region,
        r.party,
        COUNT(*) AS seats_2021
    FROM tn_2021_results r
    JOIN (
        SELECT constituency, MAX(votes) AS highest_votes
        FROM tn_2021_results
        GROUP BY constituency
    ) cw
    ON r.constituency = cw.constituency
    AND r.votes = cw.highest_votes
    GROUP BY r.region, r.party
),

winners_2026 AS (
    SELECT
        r.region,
        r.party,
        COUNT(*) AS seats_2026
    FROM tn_2026_results r
    JOIN (
        SELECT constituency, MAX(votes) AS highest_votes
        FROM tn_2026_results
        GROUP BY constituency
    ) cw
    ON r.constituency = cw.constituency
    AND r.votes = cw.highest_votes
    GROUP BY r.region, r.party
)

SELECT
    COALESCE(w21.region, w26.region) AS region,
    COALESCE(w21.party, w26.party) AS party,
    COALESCE(w21.seats_2021, 0) AS seats_2021,
    COALESCE(w26.seats_2026, 0) AS seats_2026,
    COALESCE(w26.seats_2026, 0) - COALESCE(w21.seats_2021, 0) AS seat_change
FROM winners_2021 w21
FULL OUTER JOIN winners_2026 w26
ON w21.region = w26.region
AND w21.party = w26.party
ORDER BY region, seat_change DESC;
