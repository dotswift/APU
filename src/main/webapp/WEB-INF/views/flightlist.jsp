<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="/style.css">
<meta charset="UTF-8">
<title>APU | Pickups</title>
</head>
<body id="bodytest">
	<%@include file="partials/header.jsp"%>
	<table class="table  table-hover table-dark" width=100%>
		<tr>

			<th class="text-center" width=>View</th>
			<th class="text-center" scope="col">Driver Departure</th>
			<th class="text-center" scope="col">Origin Address</th>
			<th class="text-center" scope="col">Airline</th>
			<th class="text-center" scope="col">Flight #</th>
			<th class="text-center" scope="col">Flight Origin</th>
			<th class="text-center">Refresh</th>
			<th class="text-center">Remove</th>
		</tr>
		<c:forEach var="flights" items="${flights}">
			<tr>
				<td class="text-center"><a class="btn btn-primary btn-sm"
					href="/flights/${flights.id}">Details</a></td>
				<td class="text-center">${flights.fmtDriverDepartureTime}</td>
				<td class="text-center">${flights.driverOrigin }</td>
		<td>
					
					<c:choose>
					
				<c:when test="${flights.carrierFsCode eq 'DL'}"> Delta</c:when>
				<c:when test="${flights.carrierFsCode eq 'AA'}"> American</c:when>
				<c:when test="${flights.carrierFsCode eq 'UA'}"> United</c:when>
				<c:when test="${flights.carrierFsCode eq 'WN'}"> Southwest</c:when>
				<c:when test="${flights.carrierFsCode eq 'NK'}"> Spirit</c:when>
				<c:when test="${flights.carrierFsCode eq 'AS'}"> Alaska</c:when>
				<c:when test="${flights.carrierFsCode eq 'B6'}"> JetBlue</c:when>
				<c:when test="${flights.carrierFsCode eq 'LH'}"> Lufthansa</c:when>
				<c:when test="${flights.carrierFsCode eq 'RV'}"> Air Canada</c:when>
				<c:when test="${flights.carrierFsCode eq '5D'}"> AeroMexico</c:when>
				<c:when test="${flights.carrierFsCode eq 'F9'}"> Frontier</c:when>
				<c:when test="${flights.carrierFsCode eq 'AF'}"> Air France </c:when>
				<c:when test="${flights.carrierFsCode eq 'RJ'}"> Royal Jordanian</c:when>
				<c:when test="${flights.carrierFsCode eq 'G7'}"> GoJet</c:when>
				<c:when test="${flights.carrierFsCode eq '9E'}"> Delta Connection</c:when>
				<c:otherwise>${flights.carrierFsCode}</c:otherwise>
					
					</c:choose>
					</td>
				<td class="text-center">${flights.flightNumber}</td>
				<td class="text-center">${flights.departureAirportFsCode}</td>
				<td class="text-center"><a class="btn btn-success btn-sm"
					href="/flightstatus/update?id=${flights.id}">Update</a></td>
				<td class="text-center"><a class="btn btn-danger btn-sm"
					href="/flightstatus/delete?id=${flights.id}">Delete</a></td>
			</tr>
		</c:forEach>

	</table>
	<br>
	<br>
	<br>
	<br>
</body>
</html>