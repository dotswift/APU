package flight.info.detroit;

import java.util.ArrayList;

public class AirlineCode {

	private ArrayList<FlightBoard> flightTracks;

	private Appendix appendix;

	public Appendix getAppendix() {
		return appendix;
	}

	public void setAppendix(Appendix appendix) {
		this.appendix = appendix;
	}

	public ArrayList<FlightBoard> getFlightTracks() {
		return flightTracks;
	}

	public void setFlightTracks(ArrayList<FlightBoard> flightTracks) {
		this.flightTracks = flightTracks;
	}

	@Override
	public String toString() {
		return "AirlineCode [flightTracks=" + flightTracks + appendix + "]";
	}

}
