<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log in</title>
<link rel="stylesheet" type="text/css" href="./stylelogin.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
</head>
<body>

	<!-- <div class = "xss" > 
		<form action="/XssDemo/login" method="POST">
		<table>
			<tr>
				<td>Username</td>
				<td><input type="text" name="username" placeholder="enter your username" ></td>
			<tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password" placeholder="enter your password" ></td>
			<tr>
			
			
		</table>
		<tr> <input type="submit" value="Login"> </tr>
	</form>
	</div> -->
	
	
	<div class="login-box">
			<img alt="" class="avatar" src="account.png">
			<h1>Login Here</h1>
			<form action="/XssDemo/login" method="POST">
			<p>Username </p>
			<input type="text" name="username" placeholder="Enter your username">
			<p>Password </p>
			<input type="password" name="password" placeholder="Enter your password">
			
			<input type="submit" value="Login">

		</form>

	</div>

	
</body>
</html>