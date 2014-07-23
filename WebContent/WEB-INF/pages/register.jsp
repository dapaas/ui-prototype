<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c-rt"%>
<%-- <c-rt:set var="link"
	value="<%=\"http://www.facebook.com/dialog/oauth?client_id=1458766331027628&redirect_uri=http://0.0.0.0:8080/DaPaas/fb_auth.jsp\"%>" /> --%>
<template:genericpage title="DaPaaS Signup">
	<jsp:body>
	<%-- <jsp:attribute name="footer">
		<div><a href="start_page.jsp">Home</a>|<a href="">Terms of Service</a>|<a href="">Privacy Statement</a></div>
		</jsp:attribute> --%>
		<fieldset class="signup">
	    	<legend>Sign up</legend>
	    	<div class="left-signup">
	    		<input type="text" class="input-signup" placeholder="Real names">
	    		<input type="text" class="input-signup" placeholder="e-mail">
	    		<input type="text" class="input-signup" placeholder="Username">
	    		<input type="text" class="input-signup" placeholder="Password">
	    		<input type="text" class="input-signup">
	    		<input type="text" class="input-signup">
	    		<input type="button" value="Sign up"
						class="input-signup signup-button">
	    	</div>
	    	<div class="right-signup">
	    		<label class="radio-group">Role</label>
	    		<input type="radio" name="role" value="Data explorer"
						class="role-radio" id="de">
	    		<label for="de" class="radio-group-label">Data explorer</label>
	    		
	    		<input type="radio" name="role" value="Publisher"
						class="role-radio" id="p">
	    		<label for="p" class="radio-group-label">Publisher</label>
	    		
	    		<input type="radio" name="role" value="Application developer"
						class="role-radio" id="a">
	    		<label for="a" class="radio-group-label">Application developer</label>
	    		
	    		<input type="button" value="Sign up with Facebook"
						class="input-signup signup-button social"
						onclick="location.href='fbLogin'">
				<!-- <input type="button" class="input-signup signup-button social link-button"
						>Sign up with Facebook</a> -->
	    		<input type="button" value="Sign up with Google+"
						onclick="location.href='googleLogin'"
						class="input-signup signup-button social2">
	    	</div>
	    </fieldset>
	    <fieldset class="login">
	    	<legend>Login</legend>
	    	<div class="login-text">Login with username &amp; password</div>
	    	<input type="text" class="input-signup" placeholder="Username">
	    	<input type="text" class="input-signup" placeholder="Password">
	    	<input type="button" class="signup-button input-signup"
					value="Login">
	    	<div class="login-text">Or login with social account</div>
	    	<!-- <input type="button" class="signup-button input-signup "
					value="Login with Facebook"> -->
			<a class="input-signup signup-button link-button face-sign"
					href="fbLogin">Login with Facebook</a>
	    	<input type="button" class="signup-button input-signup"
					onclick="location.href='googleLogin'" value="Login with Google+">    	
	    </fieldset>
	</jsp:body>
</template:genericpage>