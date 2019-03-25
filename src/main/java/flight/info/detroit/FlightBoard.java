package flight.info.detroit;

import java.time.LocalDateTime;

public class FlightBoard implements Comparable <FlightBoard>{

	private String carrierFsCode;
	private String flightNumber;
	private String departureAirportFsCode;
	private DepartureDate departureDate;
	private String departureTime;
	private LocalDateTime departureTimeSortable;
	
	public FlightBoard() {
		
	}

	public FlightBoard(String carrierFsCode, String flightNumber, String departureAirportFsCode,
			DepartureDate departureDate, String departureTime, LocalDateTime departureTimeSortable) {
		super();
		this.carrierFsCode = carrierFsCode;
		this.flightNumber = flightNumber;
		this.departureAirportFsCode = departureAirportFsCode;
		this.departureDate = departureDate;
		this.departureTime = departureTime;
		this.departureTimeSortable = departureTimeSortable;
	}

	public LocalDateTime getDepartureTimeSortable() {
		return departureTimeSortable;
	}

	public void setDepartureTimeSortable(LocalDateTime departureTimeSortable) {
		this.departureTimeSortable = departureTimeSortable;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public DepartureDate getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(DepartureDate departureDate) {
		this.departureDate = departureDate;
	}

	public String getCarrierFsCode() {
		return carrierFsCode;
	}

	public void setCarrierFsCode(String carrierFsCode) {
		this.carrierFsCode = carrierFsCode;
	}

	public String getFlightNumber() {
		return flightNumber;
	}

	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}

	public String getDepartureAirportFsCode() {
		return departureAirportFsCode;
	}

	public void setDepartureAirportFsCode(String departureAirportFsCode) {
		this.departureAirportFsCode = departureAirportFsCode;
	}

	@Override
	public String toString() {
		return "FlightBoard [carrierFsCode=" + carrierFsCode + ", flightNumber=" + flightNumber
				+ ", departureAirportFsCode=" + departureAirportFsCode + "]" + departureTimeSortable;
	}

	@Override
	public int compareTo(FlightBoard o) {
		
		return this.departureTimeSortable.compareTo(o.departureTimeSortable);
	}

}
