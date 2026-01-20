<cfif structKeyExists(form, "submitDonor")>
    <cfquery datasource="mymatchingdb">
        INSERT INTO Donors (FirstName, LastName, City, BloodType)
        VALUES (
            <cfqueryparam value="#form.fname#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.lname#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.city#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.bloodType#" cfsqltype="cf_sql_varchar">
        )
    </cfquery>
    <p style="color:green;">Donor added with Blood Type!</p>
</cfif>

<html>
<head>
    <title>Add New Donor</title>
    <style>
        body { font-family: Arial; padding: 20px; background: #f9f9f9; }
        .form-card { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); width: 300px; }
        input, select { margin-bottom: 15px; padding: 10px; width: 100%; display: block; border: 1px solid #ccc; border-radius: 4px; }
        button { width: 100%; padding: 10px; background: #0078D4; color: white; border: none; border-radius: 4px; cursor: pointer; }
    </style>
</head>
<body>
    <div class="form-card">
        <h2>Register Donor</h2>
        <form action="add_donor.cfm" method="post">
            <label>First Name</label>
            <input type="text" name="fname" required>
            
            <label>Last Name</label>
            <input type="text" name="lname" required>
            
            <label>City</label>
            <input type="text" name="city" required>
            
            <label>Blood Type</label>
            <select name="bloodType">
                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
            </select>
            
            <button type="submit" name="submitDonor">Save Donor</button>
        </form>
        <br>
        <a href="test.cfm">Back to Dashboard</a>
    </div>
</body>
</html>