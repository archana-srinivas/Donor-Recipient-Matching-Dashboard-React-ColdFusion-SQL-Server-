<html>
<head>
    <title>Matching Donors Project</title>
</head>
<body>
    <h1 style="color: navy;">Matching Donors: Live Dashboard</h1>
    <p>The ColdFusion bridge is now running!</p>

    <cfoutput>
        <p><strong>Server Status:</strong> Online</p>
        <p><strong>Current Date/Time:</strong> #DateFormat(now(), "mm/dd/yyyy")# #TimeFormat(now(), "full")#</p>
    </cfoutput>
    
    <hr>
    <p>Next step: Connecting to the <b>Alex Smith</b> record in SQL Server.</p>
</body>
</html>