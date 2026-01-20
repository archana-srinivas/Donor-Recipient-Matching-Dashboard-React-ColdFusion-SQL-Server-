# VitalsBridge: Donor-Recipient-Matching-Dashboard-React-ColdFusion-SQL-Server

**VitalsBridge** is a full-stack medical application designed to modernize the organ donation matching process. It serves as a technical bridge, connecting **ColdFusion (CFML)** backend with **React.js** frontend, supported by **SQL Server** database.



## 🚀 Key Features
- **Legacy Integration:** Uses ColdFusion to create a RESTful API layer that serves JSON data to modern frameworks.
- **Smart Matching Engine:** Implements a SQL-driven algorithm to calculate donor-recipient compatibility scores based on blood type and urgency.
- **Admin Dashboard:** A responsive React UI providing medical staff with real-time visibility into the donor queue.
- **Data Integrity:** Strict T-SQL schema design to ensure medical record accuracy and relational consistency.

## 🛠️ Technology Stack
- **Frontend:** React.js, JavaScript (ES6+), CSS3
- **Backend:** ColdFusion (CFML), Lucee/CommandBox, REST API
- **Database:** Microsoft SQL Server (T-SQL)
- **Version Control:** Git & GitHub

## 📂 Project Structure
- `/frontend`: The React.js dashboard application.
- `/backend`: ColdFusion (.cfm) files handling API logic and database connectivity.
- `database_setup.sql`: Complete SQL script to regenerate the database schema and sample donor data.

## 📈 Match Logic Overview
The system ranks matches using a weighted scoring system:
1. **Primary:** Blood Type Compatibility (e.g., O-Universal Donor logic).
2. **Secondary:** Organ Type Match.
3. **Tertiary:** Geographic proximity between donor and hospital.
