<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>APU | Flight Board</title>
<link rel="stylesheet" href="/style.css">
</head>

<body id="bodytest">

	<%@include file="partials/header.jsp"%>
	<table class="table table-dark">

		<thead>
			<tr>

				<th>Calculate Pickup</th>
				<th>Departure Time</th>
				<th>Origin</th>
				<th>Airline</th>
				<th>Flight Number</th>

			</tr>
		</thead>

		<tbody>
			<c:forEach var="flight" items="${ flight }">
				<tr>
<td><a class="btn btn-secondary" href="flightcode?carr=${flight.carrierFsCode }&num=${flight.flightNumber }">Select</a></td>
					<td>${flight.departureTime}</td>
					<td>${flight.departureAirportFsCode }</td>
					<td>${flight.carrierFsCode }</td>
					<td>${flight.flightNumber }</td>
			</c:forEach>
	</table>
</body>
</html>