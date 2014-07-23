<%@tag description="Dataset template" pageEncoding="UTF-8"%>
<%@taglib prefix="template" tagdir="/WEB-INF/tags"%>
<jsp:element name="table">
	<thead class="thead">
		<tr>
			<th>Dataset</th>
			<th>Date</th>
			<th>Portal</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="first-row">My data <br /> This is example dataset that i use to create my data driven portal</td>
			<td>Jan-2014</td>
			<td><a href="ddp.jsp">http://portal1.dapaas.eu</a></td>
			<td><a href="">Edit</a> | <a href="">Delete</a></td>
		</tr>
		<tr>
			<td class="first-row">Uganda population</td>
			<td>Dec-2013</td>
			<td><a href="ddp.jsp">http://portal2.dapaas.eu</a></td>
			<td><a href="">Edit</a> | <a href="">Delete</a></td>
		</tr>
		<tr>
			<td class="first-row">EU countries debt</td>
			<td>Nov-2013</td>
			<td><a href="ddp.jsp">http://portal3.dapaas.eu</a></td>
			<td><a href="">Edit</a> | <a href="">Delete</a></td>
		</tr>
		<tr>
			<td class="first-row">Forex rates</td>
			<td>2012</td>
			<td><a href="ddp.jsp">http://portal4.dapaas.eu</a></td>
			<td><a href="">Edit</a> | <a href="">Delete</a></td>
		</tr>
		<tr>
			<td class="first-row"></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</tbody>
</jsp:element>