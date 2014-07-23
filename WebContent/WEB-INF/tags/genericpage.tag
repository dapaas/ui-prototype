<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="header" fragment="true"%>
<%@attribute name="footer" fragment="true"%>
<%@attribute name="search" fragment="true"%>
<%@attribute name="navbar" fragment="true"%>
<%@attribute name="table" fragment="true"%>
<%@attribute name="title"%>
<html>
	<head>
		<link href="css/main.css" type="text/css" rel="stylesheet" />
		<link href="css/style.css" type="text/css" rel="stylesheet" />
		<link rel="stylesheet" href="css/jquery-ui-1.10.4.custom.min.css">
		<link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/ui-darkness/jquery-ui.css" rel="stylesheet">
		<link rel="stylesheet" href="css/jquery.rating.css">
		<title>${title}</title>
		<jsp:invoke fragment="header" />
	</head>
	<body>
		<a href="start_page.jsp" id="logo"></a>
		<div id="wrapper">
			<div id="searchBox">
				<jsp:invoke fragment="search" />
			</div>
			<div id="navBar">
				<jsp:invoke fragment="navbar" />
			</div>
		</div>
		<div id="clear"></div>
		<div id="body">
			<jsp:doBody />
		</div>
		<div id="pagefooter">
			<jsp:invoke fragment="footer" />
		</div>
		<script src="//code.jquery.com/jquery-1.10.2.js"></script>
		<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
		<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
		<script type="text/javascript" src="scripts/jquery.rating.js"></script>
		<script src="scripts/main-dp.js"></script>
	</body>
</html>
