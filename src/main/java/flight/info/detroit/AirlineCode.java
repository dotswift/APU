package flight.info.detroit;

import java.util.ArrayList;

public class AirlineCode {

	private ArrayList<FlightBoard> flightBoard;

	private Appendix appendix;

	public Appendix getAppendix() {
		return appendix;
	}

	public void setAppendix(Appendix appendix) {
		this.appendix = appendix;
	}

	public ArrayList<FlightBoard> getFlightBoard() {
		return flightBoard;
	}

	public void setFlightTracks(ArrayList<FlightBoard> flightBoard) {
		this.flightBoard = flightBoard;
	}

	@Override
	public String toString() {
		return "AirlineCode [flightTracks=" + flightBoard + appendix + "]";
	}

}
