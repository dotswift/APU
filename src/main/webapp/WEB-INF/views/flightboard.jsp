<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>APU | Flight Board</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>
	<%@include file="partials/header.jsp"%>

	<p>${ message }</p>

	<table class="table table-hover">

		<thead>
			<tr>

				<th>Select A Flight</th>
				<th >Departure Time</th>
				<th >Origin</th>
				<th >Airline </th>
				<th >Flight Number</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="flight" items="${ flight }">
				<tr>
					<td><a class="btn btn-primary" href="flightcode?carr=${flight.carrierFsCode }&num=${flight.flightNumber }">Select</a></td>
					<td>${flight.departureDate.dateLocal}</td>
					<td>${flight.departureAirportFsCode }</td>
					<td>${flight.carrierFsCode }</td>
					<td>${flight.flightNumber }</td>
				
						</c:forEach>					
	</table>
</body>
</html>