# PostgreSQL Setup and Validation

## Objective

After completing data cleaning, the datasets were imported into PostgreSQL for analysis.

---

## Database Environment

Tool Used:

* PostgreSQL
* pgAdmin

---

## Tables Created

### constituency_master

Purpose:

Stores constituency metadata including region and reservation category.

---

### tn_2021_results

Purpose:

Stores Tamil Nadu Assembly Election results for 2021.

---

### tn_2026_results

Purpose:

Stores Tamil Nadu Assembly Election results for 2026.

---

## Data Import Validation

The following validation checks were performed after import.

### constituency_master

```sql
SELECT COUNT(*) FROM constituency_master;
```

Result:

234 rows

---

### tn_2021_results

```sql
SELECT COUNT(*) FROM tn_2021_results;
```

Result:

4232 rows

---

### tn_2026_results

```sql
SELECT COUNT(*) FROM tn_2026_results;
```

Result:

4257 rows

---

## Data Verification

Additional checks performed:

* Table structure validation
* Column verification
* Row count verification
* Sample record inspection

---

## Outcome

All datasets were successfully imported into PostgreSQL and validated for analytical use.

The environment was approved for SQL-based election analysis.
