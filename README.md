

# Tamil Nadu Election Analysis (2021–2026)

## Project Overview

This project analyzes the Tamil Nadu Assembly Election results from 2021 and 2026 to understand how the political landscape changed over time. The analysis focuses on regional power shifts, constituency-level winner changes, and vote share movements that led to the emergence of TVK as a major political force in 2026.

The project follows a complete data analytics workflow, starting from data understanding and cleaning, progressing through SQL-based analysis, and ending with business insight generation and dashboard development.

---

# Business Problem

Tamil Nadu witnessed significant political changes between the 2021 and 2026 Assembly Elections.

Political strategists, researchers, and analysts need to understand:

* Which regions experienced the largest political shifts?
* How many constituencies changed political leadership?
* Which parties gained or lost voter support?
* Where did TVK's votes come from?
* How did regional voting patterns evolve between elections?

This project answers these questions using data-driven analysis.

---

# Dataset Overview

### constituency_master.csv

Contains constituency-level reference information:

* Constituency Name
* AC Number
* Region
* Reservation Category (General, SC, ST)

### tn_2021_results.csv

Contains 2021 election results:

* Constituency
* Candidate
* Party
* Votes
* Turnout
* Region

### tn_2026_results.csv

Contains 2026 election results:

* Constituency
* Candidate
* Party
* Votes
* Region

---

# Tools Used

* Microsoft Excel (Data Cleaning & Validation)
* PostgreSQL (SQL Analysis)
* Power BI (Dashboard & Visualization)
* GitHub (Project Documentation & Version Control)

---

# Project Workflow

Data Understanding

↓

Data Cleaning & Validation

↓

Database Preparation

↓

SQL Analysis

↓

Research Question Investigation

↓

Business Insight Generation

↓

Power BI Dashboard

↓

Final Presentation

---

# Research Questions

## Research Question 1 – Geographic Story

How did seat distribution shift across Tamil Nadu's six regions between 2021 and 2026?

### Findings

* DMK dominated 5 of 6 regions in 2021.
* TVK became the largest party in 2026.
* Chennai Metro experienced the largest regional shift.
* DMK retained leadership only in the Delta region.

---

## Research Question 2 – Flip Story

In how many constituencies did the winning party change between 2021 and 2026?

### Findings

* 162 constituencies flipped.
* 71 constituencies remained with the same party.
* Nearly 70% of constituencies changed political leadership.
* DMK → TVK was the most common constituency transition.
* TVK benefited the most from constituency-level changes.

---

## Research Question 3 – Vote Share Story

Where did TVK's votes come from?

### Findings

* TVK secured 34.92% vote share in 2026.
* DMK vote share decreased by 13.51 percentage points.
* AIADMK vote share decreased by 12.08 percentage points.
* TVK gained support from multiple parties rather than a single voter base.
* Chennai Metro, South, and Kongu regions contributed heavily to TVK's growth.

---

# Key Project Outcomes

* Identified regional political power shifts.
* Measured constituency-level winner transitions.
* Created a party transition matrix for Sankey analysis.
* Quantified vote share changes across elections.
* Analyzed the emergence of TVK using electoral data.
* Generated business-focused insights using SQL.

---

# Repository Structure

```text
Tamil-Nadu-Election-Analysis-2021-2026
│
├── datasets
│   ├── constituency_master.csv
│   ├── tn_2021_results.csv
│   └── tn_2026_results.csv
│
├── research_questions
│   ├── rq1_regional_power_shift.md
│   ├── rq2_flip_story.md
│   └── rq3_vote_share_story.md
│
├── sql
│   ├── rq1_2021_analysis.sql
│   ├── rq1_2026_analysis.sql
│   ├── rq1_power_shift_comparison.sql
│   ├── rq2_flip_story.sql
│   └── rq3_vote_share_analysis.sql
│
├── results
│   ├── rq1_power_shift_matrix.csv
│   ├── rq2_flip_matrix.csv
│   └── rq3_vote_share_summary.csv
│
├── dashboard
│
└── README.md
```

---

# Skills Demonstrated

* SQL Querying
* Common Table Expressions (CTEs)
* Joins and Aggregations
* Data Cleaning
* Data Validation
* Comparative Analysis
* Data Storytelling
* Business Insight Generation
* Election Analytics
* Power BI Visualization

---

# Project Status

✅ Research Question 1 Completed

✅ Research Question 2 Completed

✅ Research Question 3 Completed

🎯 Core Election Analysis Successfully Completed

---

# Author

**Krity Pandey**

Data Analyst

Skills: SQL | Excel | Power BI | Data Cleaning | Data Visualization | Business Analysis


