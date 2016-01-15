<!DOCTYPE html>
<html>
<head>
<title>Resource Server</title>
</head>
<body>
<h1>Resource Server - Welcome "<%= request.getRemoteUser() %>"</h1>

<h2>Tests for unprotected REST API</h2>
<ul>
<li><a href="unprotected-api/info/version">unprotected-api/info/version</a></li>
<li><a href="unprotected-api/info/user">unprotected-api/info/user</a></li>
</ul>

<h2>Tests for protected REST API</h2>
<p>Available roles are "AdministratorRole", "UserRole", "GuestRole".</p>
<p>Available "<i>Basic Authentication</i>" logins are:</p>
<ul>
<li>User <i>"admin"</i> with password <i>"admin"</i>. Groups: <i>"Administrators"</i>. Role: <i>"AdministratorRole"</i>.</li>
<li>User <i>"user01"</i> with password <i>"user01"</i>. Groups: <i>"Users"</i>. Role: <i>"UserRole"</i>.</li>
<li>User <i>"user02"</i> with password <i>"user02"</i>. Groups: <i>"Users"</i>. Role: <i>"UserRole"</i></li>
<li>User <i>"guest"</i> with password <i>"guest"</i>. Groups: <i>"Guests"</i>. Role: <i>"GuestRole"</i>.</li>
</ul>
<p>"<i>Client SSL</i>" access is possible.</p>
<ul>
<li><a href="protected-api/info/version">protected-api/info/version</a> - should be allowed for all</li>
<li><a href="protected-api/info/user">protected-api/info/user</a> - should be allowed for UserRole and AdministratorRole</li>
<li><a href="protected-api/info/admin">protected-api/info/admin</a> - should be allowed for AdministratorRole</li>
</ul>

<h2>Snoop</h2>
<ul>
<li><a href="lifecheck/snoop.jsp">lifecheck/snoop.jsp</a></li>
</ul>

</body>
</html>