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
				<th>Origin</th>
				<th>Airline</th>
				<th>Flight Number</th>
				<th>Departure Time</th>
				<th>Calculate Pickup</th>

			</tr>
		</thead>

		<tbody>
			<c:forEach var="flight" items="${ flight }">
				<tr>

					<td>${flight.departureAirportFsCode}</td>
					<td><c:choose>

							<c:when test="${flight.carrierFsCode eq 'DL'}"> Delta</c:when>
							<c:when test="${flight.carrierFsCode eq 'AA'}"> American</c:when>
							<c:when test="${flight.carrierFsCode eq 'UA'}"> United</c:when>
							<c:when test="${flight.carrierFsCode eq 'WN'}"> Southwest</c:when>
							<c:when test="${flight.carrierFsCode eq 'NK'}"> Spirit</c:when>
							<c:when test="${flight.carrierFsCode eq 'AS'}"> Alaska</c:when>
							<c:when test="${flight.carrierFsCode eq 'B6'}"> JetBlue</c:when>
							<c:when test="${flight.carrierFsCode eq 'LH'}"> Lufthansa</c:when>
							<c:when test="${flight.carrierFsCode eq 'RV'}"> Air Canada</c:when>
							<c:when test="${flight.carrierFsCode eq '5D'}"> AeroMexico</c:when>
							<c:when test="${flight.carrierFsCode eq 'F9'}"> Frontier</c:when>
							<c:when test="${flight.carrierFsCode eq 'AF'}"> Air France </c:when>
							<c:when test="${flight.carrierFsCode eq 'RJ'}"> Royal Jordanian</c:when>
							<c:when test="${flight.carrierFsCode eq 'WW'}"> WOW</c:when>
							<c:when test="${flight.carrierFsCode eq 'G7'}"> GoJet</c:when>
							<c:when test="${flight.carrierFsCode eq '9E'}"> Delta Connection</c:when>
							<c:when test="${flight.carrierFsCode eq 'OO'}"> Delta Connection</c:when>
							<c:when test="${flight.carrierFsCode eq 'YX'}"> American</c:when>
							<c:when test="${flight.carrierFsCode eq 'PDT'}"> American</c:when>
							<c:otherwise>${flight.carrierFsCode}</c:otherwise>

						</c:choose></td>
					<td>${flight.flightNumber }</td>
					<td><b>${flight.departureTime}</b></td>
<td><a class="btn btn-secondary" href="flightcode?carr=${flight.carrierFsCode }&num=${flight.flightNumber }">Select</a></td>
			</c:forEach>
	</table>
</body>
</html>