<%@page import="com.tungmr.xuli.Hash"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.CPInstruction"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tungmr.dao.JDBCConnection"%>
<%@page import="com.tungmr.dao.GetCmt"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- <meta http-equiv="Content-Security-Policy"
	content="script-src 'self' https://apis.google.com"> -->

<title>Cross-site scripting</title>
<link rel="stylesheet" type="text/css" href="./style.css">
<link rel="stylesheet" type="text/css" href="./stylelogin.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
</head>
<body>
	<div class="container" style="text-align: center;">

		<%
			String user = "";
			Cookie[] cookies = request.getCookies();
			if (cookies == null || cookies.length == 1) {
				response.sendRedirect("/XssDemo/login.jsp");
			} else {
				for (Cookie cookie : cookies) {
					if ((cookie.getName().equals("username") && cookie.getValue().equals("thienle"))
							|| (cookie.getName().equals("username") && cookie.getValue().equals("tungmr"))) {

						user = cookie.getValue();
		%>
		<div style="text-align: center;">
			<h2>
				Hello,
				<%=user%></h2>
		</div>
		<%
			break;
					} else {
						//response.sendRedirect("/XssDemo/login.jsp");
					}

				}
			}
		%>

		<div>
			<a href="/XssDemo/logout"> Log out </a>
		</div>

		<div>
			<h1>Cross-site scripting</h1>
		</div>
		<div class="xss-relative">
			<form action="index.jsp" method="post">
				<input type="text" name="comment" placeholder="Type here"
					width="300px"> <input type="submit" value="Send">
			</form>



		</div>

		<div class="cmt-box" style="color: black;">
			<%
				String ins = request.getParameter("comment");
				String chuoi = user + ": " + ins;
				GetCmt Lcmt = new GetCmt();
				ArrayList<String> listCmt = Lcmt.getListCmt();
				if (ins != null && (!(chuoi.equals(listCmt.get(listCmt.size() - 1))))) {
					Connection conn = JDBCConnection.myConnect();
					PreparedStatement ptmt;
					String sql = "INSERT INTO xsscmt(cmt) VALUES (?)";
					try {
						ptmt = conn.prepareStatement(sql);
						ptmt.setString(1, chuoi);
						ptmt.executeUpdate();
			%>
			<div class="box-cmt">
				<h4 style="font-size: 25px; font-weight: bold;">
					<%=chuoi%></h4>
				<%
					} catch (SQLException e) {
						}
					}
				%>
				<%
					if (listCmt.size() != 0) {
				%>
				<h4 style="font-size: 25px; font-weight: bold;">

					<%=listCmt.get(listCmt.size() - 1)%></h4>
				<%
					}
				%>
				<%
					for (int i = listCmt.size() - 2; i >= 0; i--) {
				%>
				<h4 style="font-size: 25px; font-weight: bold;">
					<%=listCmt.get(i)%></h4>
				<%
					}
					ins = null;
				%>
			</div>
		</div>


	</div>

</body>
</html>