package flight.info.detroit;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FlightBoardController {
	@Autowired
	private FlightStatsApiServices flightStatsApiServices;

	@RequestMapping("findflight")
	public ModelAndView showFlightBoard() {
		
		ArrayList<FlightBoard> flightStatus = flightStatsApiServices.searchFlightCode();
		
		// times being compared for flightboard 
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS");

		// add localdate time sortable departure time 	
		for (int i = 0; i < flightStatus.size(); i ++ ) {
		String departureTimeRaw = flightStatus.get(i).getDepartureDate().getDateLocal();
		LocalDateTime departureTimeSortable = LocalDateTime.parse(departureTimeRaw, formatter);
		flightStatus.get(i).setDepartureTimeSortable(departureTimeSortable);	
		}
		
		System.out.println("before sort "+ flightStatus.toString());
		
		Collections.sort(flightStatus);
		
		System.out.println("after sort "+ flightStatus.toString());
		
		ModelAndView mav = new ModelAndView("flightboard", "flight", flightStatus);
		
		mav.addObject("airportInfo", flightStatsApiServices.searchAirportCode());
		return mav;
	}

	@RequestMapping("flightcode")
	public ModelAndView sendFlightInfo(@RequestParam("carr") String carrier, @RequestParam("num") String num) {
		ModelAndView mav = new ModelAndView("flightsearch", "flightNum", carrier + num);
		return mav;
	}
}
