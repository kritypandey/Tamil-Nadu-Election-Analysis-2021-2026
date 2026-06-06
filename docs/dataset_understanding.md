# Dataset Understanding

## Introduction

This project uses three datasets to analyze Tamil Nadu Assembly Election results for 2021 and 2026.

The datasets provide constituency-level election results and reference information required for regional and party-wise analysis.

---

## Dataset 1: constituency_master.csv

### Purpose

Acts as the master reference table.

### Columns

* constituency
* ac_number
* reserved
* region

### Business Use

Provides:

* Region classification
* Reserved category information
* Constituency mapping

---

## Dataset 2: tn_2021_results.csv

### Purpose

Stores election results for the 2021 Tamil Nadu Assembly Election.

### Columns

* constituency
* candidate
* party
* votes
* turnout
* reserved
* region

### Business Use

Used to identify:

* Winning candidates
* Winning parties
* Regional seat distribution
* Political dominance in 2021

---

## Dataset 3: tn_2026_results.csv

### Purpose

Stores election results for the 2026 Tamil Nadu Assembly Election.

### Columns

* constituency
* candidate
* party
* votes
* reserved
* region

### Business Use

Used to identify:

* Winning candidates
* Winning parties
* Regional seat distribution
* Political shifts between 2021 and 2026

---

## Dataset Relationships

The datasets are connected through:

* constituency
* ac_number
* region

These fields allow comparisons across election years and support region-wise analysis.

---

## Analytical Goal

The primary objective is to compare election outcomes between 2021 and 2026 and identify:

* Regional power shifts
* Party performance changes
* Emerging political trends
* Seat distribution changes
