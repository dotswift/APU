<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="/images/favicon.ico" rel="icon" type="image/x-icon" />
<style>
</style>

<title>APU | Search</title>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet" href="/style.css">

</head>


<body id="bodytest">



	<%@include file="partials/header.jsp"%>

	<div class="container">

		<form action="/flightresults" style="text-align: center;">
			<br>
			<h1 style="text-align: center; color: #ffffff;">Airport Pickup
				Utility(APU)</h1>
			<h4 style="color: #ffffff;">Your final approach to the perfect
				pickup at DTW.</h4>
			<br>
			<center>
				<small id="emailHelp" style="text-align: center; color: #ffffff;">Enter
					a flight number, or browse for a flight.</small> <br>
				<table width=500px style="text-align: right;">
					<tr>
						<td><input class="form-control col-form-label-lg"
							name="flightcode" placeholder="e.g. DL2882" value="${flightNum}"
							size="45" min="4" maxlength="6" required
							pattern="[A-Za-z0-9]{3}\d{2,4}" style="width: 200px;" /></td>


						<td><a href="findflight" class="btn btn-secondary btn-lg">Browse
								Flights</a></td>
					</tr>

				</table>

				<br> <small id="emailHelp"
					style="text-align: center; color: #ffffff;">Where does your
					pickup originate from? </small> <br> <input
					class="form-control col-form-label-lg" type="text" name="origin"
					placeholder="Pickup Origin Address" style="width: 500px;" size=3 required>
				 <br>
	
			
					<h4 style="color: #ffffff;">Optional information for improved accuracy:</h4>
<p>
			<small id="emailHelp" style="text-align: center; color: #ffffff;">
				Is your passenger checking bags?</small>
			<div class="custom-control custom-switch">



				<input type="checkbox" name="bags" value="true"
					class="custom-control-input" id="customSwitch1"> <label
					class="custom-control-label" for="customSwitch1"><b
					style="color: #ffffff; font-size: 120%;">Checked Bags?</b></label>
			<p>
			<small id="emailHelp" style="text-align: center; color: #ffffff;">
				Do you know your passengers seat number?</small>
	
		<input class="form-control col-form-label-lg" type="text" name="seat"
		pattern="[0-9]{1,2}[a-zA-Z]" placeholder="e.g. 20A" style="width: 100px;" min="2" maxlength="4" size=2>

	</div>
			<br> <input class="btn btn-secondary btn-lg" type="submit"
				value="Calculate Pickup">
		</form>
		
	</div>
	</center>

<br>
<br>

</body>
<footer> </footer>
</html>