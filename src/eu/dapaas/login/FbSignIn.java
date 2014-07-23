package eu.dapaas.login;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "fbLogin", urlPatterns = {"/fbLogin", "/fb_auth.jsp"})
public class FbSignIn extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String callbackURL = null;

		try {
			StringBuffer callbackURLbuffer = request.getRequestURL();
			int index = callbackURLbuffer.lastIndexOf("/");
			callbackURLbuffer.replace(index, callbackURLbuffer.length(), "")
					.append("/callbackFB");
			callbackURL = URLEncoder.encode(callbackURLbuffer.toString(),
					"UTF-8");
			String FBClientId = getServletContext().getInitParameter(
					"FBClientId");

			String authURL = "http://www.facebook.com/dialog/oauth?client_id="
					+ FBClientId + "&redirect_uri="
					+ callbackURL;
			System.out.println("authURL: " + authURL); 
			response.sendRedirect(authURL);

		} catch (Exception e) {
			throw new ServletException(e);
		}

	}
}
