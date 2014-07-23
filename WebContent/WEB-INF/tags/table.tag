<%@tag description="Table template" pageEncoding="UTF-8"%>
<%@taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@attribute description="tHead col 1 name" name="col1"%>
<%@attribute description="tHead col 2 name" name="col2"%>
<%@attribute description="tHead col 3 name" name="col3"%>
<%@attribute description="tHead col 4 name" name="col4"%>
<%@attribute description="table body data" name="values"%>

<div class="but-wrapper">
	<input type="button" value="< Prev Page"> 
	<input type="button" value="Next Page >">
</div>
<table>
	<thead class="thead">
		<tr>
			<th>${col1}</th>
			<th>${col2}</th>
			<th>${col3}</th>
			<th>${col4}</th>
		</tr>
	</thead>
	<tbody>

		<%-- <c:forEach items="${values}" var="row">
			<tr>
				<c:forEach items="${row}" var="value">

					<td>${value}</td>

				</c:forEach>

			</tr>
		</c:forEach> --%>
		<tr>
			<td class="first-row">My data</td>
			<td>Peter</td>
			<td>Jan-2014</td>
			<td><a href="ddp.jsp">http://portal1.dapaas.eu</a></td>
		</tr>
		<tr>
			<td class="first-row">Uganda population</td>
			<td>John Smith</td>
			<td>Dec-2013</td>
			<td><a href="ddp.jsp">http://portal2.dapaas.eu</a></td>
		</tr>
		<tr>
			<td class="first-row">EU countries debt</td>
			<td>Jessica</td>
			<td>Nov-2013</td>
			<td><a href="ddp.jsp">http://portal3.dapaas.eu</a></td>
		</tr>
		<tr>
			<td class="first-row">Forex rates</td>
			<td>Brown</td>
			<td>2012</td>
			<td><a href="ddp.jsp">http://portal4.dapaas.eu</a></td>
		</tr>
	</tbody>
</table>


<%-- <jsp:element name="table">
		<div class="butWrapper">
			<input type="button" value="< Prev Page">
			<input type="button" value="Next Page >">
		</div>
		<thead class="thead">
			<tr>
				<th>Dataset</th>
				<th>User</th>
				<th>Published</th>
				<th>Portal</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="first-row">My data</td>
				<td>Peter</td>
				<td>Jan-2014</td>
				<td><a href="ddp.jsp">http://portal1.dapaas.eu</a></td>
			</tr>
			<tr>
				<td class="first-row">Uganda population</td>
				<td>John Smith</td>
				<td>Dec-2013</td>
				<td><a href="ddp.jsp">http://portal2.dapaas.eu</a></td>
			</tr>
			<tr>
				<td class="first-row">EU countries debt</td>
				<td>Jessica</td>
				<td>Nov-2013</td>
				<td><a href="ddp.jsp">http://portal3.dapaas.eu</a></td>
			</tr>
			<tr>
				<td class="first-row">Forex rates</td>
				<td>Brown</td>
				<td>2012</td>
				<td><a href="ddp.jsp">http://portal4.dapaas.eu</a></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody> 
</jsp:element>--%>