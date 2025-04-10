# SSIS Assignment Solutions

This repository contains solutions for the four SSIS tasks outlined in the assignment. Each solution is organized in its own folder with documentation.

## 📁 Project Structure

```
/Question_1
│ ├── University_API.dtsx # SSIS package for API ingestion
│ └── Create_University_Table.sql # SQL script for target table
/Question_2
│ ├── SCD_Type4.dtsx # SSIS package for SCD Type 4
│ └── Employee_Tables.sql # SQL scripts for current/history tables
/Question_3
│ ├── Versioning_Logic.dtsx # SSIS package for versioning
│ └── Employee_Q3_Target.sql # Target table schema
/Question_4
│ ├── Attendance_Transformation.dtsx # SSIS package for attendance logic
│ └── Attendance_Tables.sql # Source/target table scripts
```

## 🛠️ Tools Required
- SQL Server Database
- SQL Server Integration Services (SSIS)
- Visual Studio (with SSIS extensions)
- Postman/curl (for testing APIs in Question 1)

---

## 📝 Question-wise Details

### **1. Consume REST API & Load to Database**
#### Overview
- **API**: [Universities API](http://universities.hipolabs.com/search)
- **Target Table**: `University` with columns `name`, `country`, `alpha_two_code`.

#### Implementation Steps
1. Create the `University` table using [Create_University_Table.sql](Question_1/Create_University_Table.sql).
2. Use a **Script Component** in SSIS to call the API and parse JSON.
3. Load data into the table using an **OLE DB Destination**.

---

### **2. SCD Type 4 (Current + History Tables)**
#### Overview
- **Source Table**: `Employee_Q2`
- **Target Tables**: 
  - `Employee_Current` (latest data)
  - `Employee_History` (past versions of `City` and `Email`).

#### Implementation Steps
1. Run [Employee_Tables.sql](Question_2/Employee_Tables.sql) to create target tables.
2. Use **Lookup Transformation** to detect changes.
3. Insert old records into `Employee_History` and update `Employee_Current`.

---

### **3. Versioning with Same-Day Resets**
#### Overview
- **Source Table**: `Employee_Q3`
- **Target Table**: `Employee_Versioned` with `Active_Flag`, `Version_No`, and `Insert_Date`.

#### Key Logic
- Increment `Version_No` on same-day runs.
- Reset to `Version_No = 1` on a new day.
- Use **SSIS Variables** to track dates and versions.

---

### **4. Attendance Data Transformation**
#### Overview
- **Source Table**: `Attendance_Device`
- **Target Table**: `Employee_Attendance_Details` with calculated `Worked_Hours` and `State`.

#### Logic for `State` Calculation
```sql
CASE
  WHEN Time_Out IS NULL THEN 'no check out'
  WHEN DATEDIFF(HOUR, Time_In, Time_Out) >= 8 AND Time_In <= '09:00' THEN 'ebn el-shrka'
  -- Add other conditions here
END
```
