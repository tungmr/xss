package com.tungmr.xuli;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.SendResult;

@WebServlet(urlPatterns = { "/login" })
public class login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String user = req.getParameter("username");
		String pass = req.getParameter("password");

		if ((user.equals("tungmr") && pass.equals("123456")) || (user.equals("thienle") && pass.equals("123456"))) {

			Cookie cookie = new Cookie("username", user);
			cookie.setMaxAge(1200);
			resp.addCookie(cookie);

			HttpSession httpSession = req.getSession();
			httpSession.setAttribute("name", "Tung MR");

			resp.sendRedirect("/XssDemo/index.jsp");

		} else {
			resp.sendRedirect("/XssDemo/login.jsp");
		}

	}

}
