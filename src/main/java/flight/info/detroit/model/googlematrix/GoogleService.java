package flight.info.detroit.model.googlematrix;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import flight.info.detroit.User;
import flight.info.detroit.model.googlematrix.GoogleUser;

@Component
public class GoogleService {
	
	@Value("${google.client_secret}")
	private String clientSecret;
	@Value("${google.client_id}")
	private String clientId;

	
	 // Get access token from Google's server
	 
	public String getGoogleAccessToken(String code) {
		
		Map<String, String> params = new HashMap<>();
		params.put("code", code);
		params.put("client_id", clientId);
		params.put("client_secret", clientSecret);
		params.put("redirect_uri", "/oauth2callback");
		params.put("grant_type", "authorization_code");
		RestTemplate rest = new RestTemplate();
		@SuppressWarnings("unchecked")
		Map<String, String> response = rest.postForObject("https://www.googleapis.com/oauth2/v4/token", params,
				Map.class);
		return response.get("access_token");
	}

	//Use the access token to get user details.
	 
	public User getUserFromGoogleApi(String access_token) {
		// We'll talk more about rest template in the coming days.
		RestTemplate rest = new RestTemplate();
		String uri = "https://www.googleapis.com/drive/v2/files?access_token=" + access_token;
		GoogleUser response = rest.getForObject(uri, GoogleUser.class);
		User user = new User();
		response.copyToUser(user);
		return user;
	}
}
