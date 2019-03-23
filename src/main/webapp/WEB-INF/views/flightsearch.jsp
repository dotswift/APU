<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>

</style> 

<title>APU | Search</title>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- <link href="../../css/editor.css" rel="stylesheet">  -->

<!-- Custom styles for this template -->
<link  rel="stylesheet" href="/style.css"> 
<!-- <link rel="stylesheet" href="/progressbarstyle.css" /> -->

</head>


<body id="bodytest">

<%@include file="partials/header.jsp"%>



	<div class="container">

		<form action="/flightresults" style="text-align:center;">
			<br>
			<h1 class="display-4" style="text-align: center; color:#ffffff;">
				
					 Airport Pickup Utility(APU)</h1>
					 <h6 style="color:#ffffff;"><b>Your Pathway to DTW</b></h6>
					<br><br>
					 
					 
				<div class="form-group">
					<input class="form-control input-sm" name="flightcode"
						placeholder="Flight Number Ex: DL2882 " value="${flightNum}" size="45"
						min="4" maxlength="6" required pattern="[A-Za-z0-9]{2}\d{2,4}" /><br>
<!-- 	<a href="findflight">Flight Board</a>  -->

				</div>
				<br>
			
					<input class="form-control input-sm" type="text" name="origin" placeholder="Address Ex: 1538 Centre St, Detroit, MI" style="text-align: center:"
						size="45" required><br>
						<div class="custom-control custom-switch">


<input type="checkbox" name="bags" value="true" class="custom-control-input" id="customSwitch1" style="text-align:left;"> </input>
<label class="custom-control-label" for="customSwitch1"><b style="color:#007bff;font-size: 120%; vertical-align: text-bottom;">Checked Bags?</b></label>


			
				
				</div>
			<br>
					<input class="btn btn-primary" type="submit" value="Calculate Pickup">
		</form>
	</div>
	

	
</body>
</html>