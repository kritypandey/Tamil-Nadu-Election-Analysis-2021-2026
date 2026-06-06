-- =========================================
-- RESEARCH QUESTION 3
-- VOTE SHARE STORY
-- =========================================

-- Business Question:
-- Where did TVK's votes come from?
--
-- Compare party vote share statewide and by region
-- between 2021 and 2026.
--
-- Did TVK gain support from DMK, AIADMK,
-- both, or other parties?


-- =========================================
-- QUERY 1: STATEWIDE PARTY VOTE TOTALS (2021)
-- =========================================

SELECT
    party,
    SUM(votes) AS total_votes
FROM tn_2021_results
GROUP BY party
ORDER BY total_votes DESC;


-- =========================================
-- QUERY 2: STATEWIDE PARTY VOTE TOTALS (2026)
-- =========================================

SELECT
    party,
    SUM(votes) AS total_votes
FROM tn_2026_results
GROUP BY party
ORDER BY total_votes DESC;


-- =========================================
-- QUERY 3: STATEWIDE VOTE SHARE (2021)
-- =========================================

SELECT
    party,
    SUM(votes) AS total_votes,
    ROUND(
        100.0 * SUM(votes) /
        (SELECT SUM(votes) FROM tn_2021_results),
        2
    ) AS vote_share_pct
FROM tn_2021_results
GROUP BY party
ORDER BY total_votes DESC;


-- =========================================
-- QUERY 4: STATEWIDE VOTE SHARE (2026)
-- =========================================

SELECT
    party,
    SUM(votes) AS total_votes,
    ROUND(
        100.0 * SUM(votes) /
        (SELECT SUM(votes) FROM tn_2026_results),
        2
    ) AS vote_share_pct
FROM tn_2026_results
GROUP BY party
ORDER BY total_votes DESC;


-- =========================================
-- QUERY 5: REGIONAL VOTE TOTALS (2021)
-- =========================================

SELECT
    region,
    party,
    SUM(votes) AS total_votes
FROM tn_2021_results
GROUP BY region, party
ORDER BY region, total_votes DESC;


-- =========================================
-- QUERY 6: REGIONAL VOTE TOTALS (2026)
-- =========================================

SELECT
    region,
    party,
    SUM(votes) AS total_votes
FROM tn_2026_results
GROUP BY region, party
ORDER BY region, total_votes DESC;
