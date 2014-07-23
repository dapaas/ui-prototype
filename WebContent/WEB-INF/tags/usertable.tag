<%@tag description="User table template" pageEncoding="UTF-8"%>
<%@taglib prefix="template" tagdir="/WEB-INF/tags"%>
<jsp:element name="table">
	<div class="but-wrapper">
		<input type="button" value="< Prev Page">
		<input type="button" value="Next Page >">
	</div>
	<thead class="thead">
		<tr>
			<th>Name(job title)</th>
			<th>Age</th>
			<th>Nickname</th>
			<th>Employee</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Giacomo Guilizzoni <br />Founder &amp; CEO</td>
			<td>37</td>
			<td>Peldi</td>
			<td><input type="radio"></td>
		</tr>
		<tr>
			<td>Marco Botton <br /> Tuttofare</td>
			<td>34</td>
			<td></td>
			<td><input type="checkbox" checked="checked"></td>
		</tr>
		<tr>
			<td>Mariah Maclachlan <br /> Better Half</td>
			<td>37</td>
			<td>Patata</td>
			<td><input type="checkbox"></td>
		</tr>
		<tr>
			<td>Valerie Liberty <br /> Head Chef</td>
			<td>:)</td>
			<td>Val</td>
			<td><input type="checkbox" checked="checked"></td>
		</tr>
	</tbody>
</jsp:element>