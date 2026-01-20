<cfheader name="Access-Control-Allow-Origin" value="*">
<cfcontent type="application/json">

<cfparam name="url.bloodType" default="O-">
<cfparam name="url.city" default="">

<cfquery name="GetMatches" datasource="mymatchingdb">
    SELECT 
        DonorID as id, 
        FirstName as firstName, 
        LastName as lastName, 
        BloodType as bloodType, 
        City as city
    FROM Donors
</cfquery>

<cfset results = []>

<cfloop query="GetMatches">
    <cfset score = 0>
    
    <cfif GetMatches.bloodType eq url.bloodType>
        <cfset score = 100>
    <cfelseif url.bloodType eq "AB+">
        <cfset score = 90>
    </cfif>
    
    <cfif len(url.city) gt 0 AND LCase(trim(GetMatches.city)) eq LCase(trim(url.city))>
        <cfset score = score + 10>
    </cfif>

    <cfset arrayAppend(results, {
        "id": GetMatches.id,
        "firstName": GetMatches.firstName,
        "lastName": GetMatches.lastName,
        "bloodType": GetMatches.bloodType,
        "city": GetMatches.city,
        "matchScore": score
    })>
</cfloop>

<cfset arraySort(results, function(e1, e2){
    return e2.matchScore - e1.matchScore;
})>

<cfoutput>#serializeJSON(results)#</cfoutput>