<cfif structKeyExists(url, "deleteID")>
    <cfquery datasource="mymatchingdb">
        DELETE FROM Donors 
        WHERE DonorID = <cfqueryparam value="#url.deleteID#" cfsqltype="cf_sql_integer">
    </cfquery>
    <p style="color:red;">User Deleted Successfully!</p>
</cfif>

<cfquery name="GetDonors" datasource="mymatchingdb">
    SELECT * FROM Donors
</cfquery>

<html>
<head>
    <title>Donor Dashboard</title>
    <style>
        body { font-family: Arial; padding: 30px; background-color: #f4f4f4; }
        table { width: 100%; border-collapse: collapse; background: white; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); }
        th, td { padding: 12px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #0078D4; color: white; }
        .del-btn { color: #d9534f; text-decoration: none; font-weight: bold; }
        .del-btn:hover { color: #c9302c; }
        .add-link { display: inline-block; margin-bottom: 10px; padding: 10px; background: #5cb85c; color: white; text-decoration: none; border-radius: 4px; }
    </style>
</head>
<body>

    <h2>Donor Management System</h2>
    <a href="add_donor.cfm" class="add-link">+ Add New Donor</a>
    
    <table>
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Blood Type</th> <th>City</th>
            <th>Actions</th>
        </tr>
        <cfoutput query="GetDonors">
        <tr>
            <td>#DonorID#</td>
            <td>#FirstName#</td>
            <td>#LastName#</td>
            <td><strong>#BloodType#</strong></td> <td>#City#</td>
           <td>
                <a href="edit_donor.cfm?id=#DonorID#" style="color:orange; margin-right:10px;">Edit</a>
                <a href="test.cfm?deleteID=#DonorID#" 
                   class="del-btn" 
                   onclick="return confirm('Are you sure?');">
                    Delete
                </a>
            </td>
        </tr>
        </cfoutput>
    </table>

</body>
</html>