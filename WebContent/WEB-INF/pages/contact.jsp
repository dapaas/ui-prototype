<%@page contentType="text/html" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<template:genericpage title="DaPaaS | Contact us">
	<jsp:body>
		<h2>Contact us</h2>
		<p>Thank you for your interest in DaPaaS. We’d love to hear from you.</p>
		<p>Please send us an email and let us know what we can do for you, and we will contact you promptly.</p>
		<form method="post">
			
			<div class="contact-info-wrapper">
				<label for="contact-info">Name
				<span class="required">*</span>
				</label>
				<input class="contact-info" required="required">
			</div>
			<div class="contact-info-wrapper">
				<label for="contact-info">E-mail
				<span class="required">*</span>
				</label>
				<input class="contact-info" placeholder="mail@example.com"
					required="required">
			</div>
			<div class="contact-info-wrapper">
				<label for="contact-message">Message
				<span class="required">*</span>
				</label>
				<textarea class="contact-message" required="required"></textarea>
			</div>
			<p id="req-field-desc">
				<span class="required">*</span> indicates a required field</p>
			<input type="submit" value="Send" id="contact-but">
		</form>
	</jsp:body>
</template:genericpage>