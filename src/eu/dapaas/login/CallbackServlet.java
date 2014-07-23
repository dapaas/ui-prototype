package eu.dapaas.login;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.JsonObject;

import eu.dapaas.dao.FacebookUser;
import eu.dapaas.dao.GooglePlusUser;

@WebServlet(name = "callback", urlPatterns = { "/callbackGoogle", "/callbackFB" })
public class CallbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static JSONObject getWebContentFromURL_Post(String httpURL,
			List<NameValuePair> nvps) {

		HttpPost httpPost = null;
		JSONObject json = null;

		try {
			DefaultHttpClient httpclient = new DefaultHttpClient();
			httpPost = new HttpPost(httpURL);
			httpPost.setEntity(new UrlEncodedFormEntity(nvps));
			org.apache.http.HttpResponse response = httpclient
					.execute(httpPost);

			BufferedReader reader = new BufferedReader(new InputStreamReader(
					response.getEntity().getContent(), "UTF-8"));
			StringBuilder builder = new StringBuilder();
			for (String line = null; (line = reader.readLine()) != null;) {
				builder.append(line).append("\n");
			}

			if (builder.indexOf("{", 0) == -1) {
				JsonObject obj = new JsonObject();
				obj.addProperty("access_token", builder.toString());

				json = (JSONObject) new JSONParser().parse(obj.toString());

			} else {
				json = (JSONObject) new JSONParser().parse(builder.toString());
			}

		} catch (Exception ex) {
			System.out.println("Err?");

		} finally {

		}
		return json;
	}

	private static JSONObject getWebContentFromURL_Get(String httpURL) {

		JSONObject json = null;

		try {

			URL u = new URL(httpURL);
			URLConnection response = u.openConnection();

			BufferedReader reader = new BufferedReader(new InputStreamReader(
					response.getInputStream(), "UTF-8"));
			StringBuilder builder = new StringBuilder();
			for (String line = null; (line = reader.readLine()) != null;) {
				builder.append(line).append("\n");
			}

			json = (JSONObject) new JSONParser().parse(builder.toString());

		} catch (Exception ex) {

		} finally {

		}
		return json;
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String code = null;
		String googlePlusClientId = getServletContext().getInitParameter(
				"googlePlusClientId");
		String googlePlusClientSecret = getServletContext().getInitParameter(
				"googlePlusClientSecret");

		String FBClientId = getServletContext().getInitParameter("FBClientId");
		String FBClientSecret = getServletContext().getInitParameter(
				"FBClientSecret");
		String redirectURL = null;
		String accessURL = null;
		String apiURL = null;
		String accessToken = null;
		JSONObject webContent = null;
		JSONObject userJson = null;

		StringBuffer redirectURLbuffer = request.getRequestURL();

		int a = redirectURLbuffer.lastIndexOf("/");
		String choice = redirectURLbuffer.substring(a + 1);
		if (choice.equals("callbackGoogle")) {
			try {
				redirectURL = redirectURLbuffer.toString();
				code = request.getParameter("code");
				if (null != code) {
					accessURL = "https://accounts.google.com/o/oauth2/token";

					List<NameValuePair> nvps = new ArrayList<NameValuePair>();
					nvps.add(new BasicNameValuePair("client_id",
							googlePlusClientId));
					nvps.add(new BasicNameValuePair("client_secret",
							googlePlusClientSecret));
					nvps.add(new BasicNameValuePair("grant_type",
							"authorization_code"));
					nvps.add(new BasicNameValuePair("redirect_uri", redirectURL));
					nvps.add(new BasicNameValuePair("code", code));

					webContent = getWebContentFromURL_Post(accessURL, nvps);
					accessToken = (String) webContent.get("access_token");

				} else {
					response.sendRedirect(request.getContextPath()
							+ "/error.html");
					return;
				}

				if (null != accessToken) {
					apiURL = "https://www.googleapis.com/oauth2/v1/userinfo?access_token="
							+ accessToken;
					userJson = getWebContentFromURL_Get(apiURL);

					GooglePlusUser googlePlusUser = new GooglePlusUser(userJson
							.get("id").toString(), userJson.get("email")
							.toString(), userJson.get("given_name").toString(),
							userJson.get("family_name").toString(), userJson
									.get("name").toString(), userJson.get(
									"link").toString(), userJson.get("picture")
									.toString(), userJson.get("gender")
									.toString(), null,// userJson.get("birthday").toString()
							userJson.get("locale").toString());
					request.getSession().setAttribute("googlePlusUser",
							googlePlusUser);

					response.sendRedirect(request.getContextPath()
							+ "/start_page.jsp");
				}

				if (null == accessToken)
					response.sendRedirect(request.getContextPath()
							+ "/error.html");

			} catch (Exception e) {
				response.sendRedirect(request.getContextPath() + "/error.html");
				throw new ServletException(e);
			}

		} else if (choice.equals("callbackFB")) {

			try {

				redirectURL = redirectURLbuffer.toString();

				code = request.getParameter("code");
				if (null != code) {
					accessURL = "https://graph.facebook.com/oauth/access_token";

					List<NameValuePair> nvps = new ArrayList<NameValuePair>();
					nvps.add(new BasicNameValuePair("client_id", FBClientId));
					nvps.add(new BasicNameValuePair("client_secret",
							FBClientSecret));
					nvps.add(new BasicNameValuePair("redirect_uri", redirectURL));
					nvps.add(new BasicNameValuePair("code", code));

					webContent = getWebContentFromURL_Post(accessURL, nvps);
					System.out.println(webContent);
					accessToken = (String) webContent.get("access_token");
					System.out.println("access tt: " + accessToken);

				} else {
					response.sendRedirect(request.getContextPath()
							+ "/error.html");
					return;
				}

				if (null != accessToken) {
					apiURL = "https://graph.facebook.com/me?" + accessToken;
					userJson = getWebContentFromURL_Get(apiURL);

					String facebookId = (String) userJson.get("id");

					String img = "https://graph.facebook.com/" + facebookId
							+ "/picture";

					FacebookUser facebookUser = new FacebookUser(
							(String) userJson.get("id"),
							(String) userJson.get("email"),
							(String) userJson.get("first_name"),
							(String) userJson.get("last_name"), img);

					request.getSession().setAttribute("facebookUser",
							facebookUser);

					response.sendRedirect(request.getContextPath()
							+ "/start_page.jsp");
				}

				if (null == accessToken)
					response.sendRedirect(request.getContextPath()
							+ "/error.html");

			} catch (Exception e) {
				response.sendRedirect(request.getContextPath() + "/error.html");
				throw new ServletException(e);
			}
		}
	}
}