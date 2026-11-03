# RTU Database SQL Assessment

SQL practice using the Remote Terminal Unit (RTU) assignment dataset in MySQL.

## Files

```text
rtu-sql-assessment/
├── database/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_insert_sample_data.sql
│   └── 04_check_data.sql
├── practice/
│   ├── 01_simple_queries.sql
│   ├── 02_single_row_functions.sql
│   ├── 03_group_functions.sql
│   └── 04_joins_practice.sql
└── README.md
```

## Database

The assignment uses four tables:

- `RTU`: RTU ID, location and IP address
- `SENSORS`: sensor details and readings, linked to an RTU
- `USERS`: users and their roles
- `CONTROLLER`: which user controls which sensor

The sample data contains 5 RTUs, 11 sensors, 3 users and 14 controller records.

## Setup

Open MySQL (`mysql -u root -p`) and execute these files in order:

```sql
SOURCE /full/path/rtu-sql-assessment/database/01_create_database.sql;
SOURCE /full/path/rtu-sql-assessment/database/02_create_tables.sql;
SOURCE /full/path/rtu-sql-assessment/database/03_insert_sample_data.sql;
SOURCE /full/path/rtu-sql-assessment/database/04_check_data.sql;
```

Run the insert file **only once** for a new database. If the data is already loaded, use `04_check_data.sql` to verify it instead.

## Practice progress

- [x] Simple queries — 6/6
- [x] Single row functions — 2/2
- [x] Group functions — 5/5 (Q2 corrected after the first attempt)
- [ ] Joins — Q1 not completed; two INNER JOIN versions tested
- [ ] Subqueries — not started

The `04_joins_practice.sql` file contains the joins tried so far. They return matching RTUs and sensors, but do not include RTUs without sensors, so the first joins question is still pending.

## Running practice queries

For example, at the MySQL prompt:

```sql
SOURCE /full/path/rtu-sql-assessment/practice/01_simple_queries.sql;
```

The other practice files can be run the same way. They contain SELECT statements and do not change the sample data.

## Notes

- This was practiced using MySQL 8.4.
- Disabled sensors have `NULL` in `CURR_VAL`.
- The dataset uses `R102` (not `102`) as the RTU ID for Mumbai.
- Percentage deviation in the single-row exercise is calculated relative to `REQ_VAL`.
- The assignment question sheet is **Remote Terminal Unit Database_assignment.docx**.
