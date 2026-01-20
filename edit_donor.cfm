<cfif structKeyExists(url, "id")>
    <cfquery name="GetDonor" datasource="mymatchingdb">
        SELECT * FROM Donors WHERE DonorID = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
    </cfquery>
</cfif>

<cfif structKeyExists(form, "updateDonor")>
    <cfquery datasource="mymatchingdb">
        UPDATE Donors 
        SET FirstName = <cfqueryparam value="#form.fname#" cfsqltype="cf_sql_varchar">,
            LastName = <cfqueryparam value="#form.lname#" cfsqltype="cf_sql_varchar">,
            City = <cfqueryparam value="#form.city#" cfsqltype="cf_sql_varchar">,
            BloodType = <cfqueryparam value="#form.bloodType#" cfsqltype="cf_sql_varchar">
        WHERE DonorID = <cfqueryparam value="#form.donorID#" cfsqltype="cf_sql_integer">
    </cfquery>
    <cflocation url="test.cfm" addtoken="false">
</cfif>

<html>
<head><title>Edit Donor</title></head>
<body style="font-family: Arial; padding: 20px;">
    <h2>Edit Donor</h2>
    <cfoutput>
    <form action="edit_donor.cfm" method="post" style="width: 300px;">
        <input type="hidden" name="donorID" value="#GetDonor.DonorID#">
        
        <label>First Name:</label>
        <input type="text" name="fname" value="#GetDonor.FirstName#" style="width:100%; margin-bottom:10px;">
        
        <label>Last Name:</label>
        <input type="text" name="lname" value="#GetDonor.LastName#" style="width:100%; margin-bottom:10px;">
        
        <label>City:</label>
        <input type="text" name="city" value="#GetDonor.City#" style="width:100%; margin-bottom:10px;">
        
        <label>Blood Type (#GetDonor.BloodType#):</label>
        <select name="bloodType" style="width:100%; margin-bottom:10px;">
            <option value="A+" <cfif GetDonor.BloodType EQ "A+">selected</cfif>>A+</option>
            <option value="A-" <cfif GetDonor.BloodType EQ "A-">selected</cfif>>A-</option>
            <option value="B+" <cfif GetDonor.BloodType EQ "B+">selected</cfif>>B+</option>
            <option value="B-" <cfif GetDonor.BloodType EQ "B-">selected</cfif>>B-</option>
            <option value="O+" <cfif GetDonor.BloodType EQ "O+">selected</cfif>>O+</option>
            <option value="O-" <cfif GetDonor.BloodType EQ "O-">selected</cfif>>O-</option>
            <option value="AB+" <cfif GetDonor.BloodType EQ "AB+">selected</cfif>>AB+</option>
            <option value="AB-" <cfif GetDonor.BloodType EQ "AB-">selected</cfif>>AB-</option>
        </select>
        
        <button type="submit" name="updateDonor" style="background:orange; color:white; padding:10px; border:none; width:100%;">Update Changes</button>
    </form>
    </cfoutput>
</body>
</html>