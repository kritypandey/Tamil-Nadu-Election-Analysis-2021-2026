# Data Cleaning Report

## Objective

Before analysis, all datasets were reviewed for potential data quality issues.

The review focused on:

* Missing values
* Duplicate records
* Standardization issues
* Column validation

---

## Dataset: tn_2021_results.csv

### Missing Values Check

Columns reviewed:

* constituency
* candidate
* party
* votes
* turnout
* reserved
* region

Result:

No missing values were found.

---

### Duplicate Records Check

Method:

Excel Remove Duplicates feature.

Result:

No duplicate records identified.

---

### Standardization Review

Checked:

* Constituency names
* Party names
* Reserved categories
* Region values

Result:

Values were found to be consistent and analysis-ready.

---

## Dataset: tn_2026_results.csv

### Missing Values Check

Columns reviewed:

* constituency
* candidate
* party
* votes
* reserved
* region

Result:

No missing values found.

---

### Turnout Column

Observation:

The turnout column was completely blank.

Decision:

The column was retained but excluded from analytical calculations.

---

### Duplicate Records Check

Result:

No duplicate records identified.

---

## Data Quality Conclusion

Both datasets passed data quality checks and were considered suitable for PostgreSQL analysis.

---

## Tools Used

* Microsoft Excel
* Filtering
* Remove Duplicates
* Manual Validation
