package flight.info.detroit;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import flight.info.detroit.flightdao.UserDao;
import flight.info.detroit.model.googlematrix.GoogleService;


@Controller
public class AuthController {

	@Autowired
	UserDao userDao;
	@Autowired
	GoogleService googleService;

	@RequestMapping("/login")
	public ModelAndView showLoginForm() {
		return new ModelAndView("login");
	}

	@PostMapping("/login")
	// get the username and password from the form when it's submitted.
	public ModelAndView submitLoginForm(
			@RequestParam("username") String username,
			@RequestParam("password") String password,
			HttpSession session, RedirectAttributes redir) {
		// Find the matching user.
		User user = userDao.findByUsername(username);
		if (user == null || !password.equals(user.getPassword())) {
			// If the user or password don't match, display an error message.
			ModelAndView mav = new ModelAndView("login");
			mav.addObject("message", "Incorrect username or password.");
			return mav;
		}
		
		// On successful login, add the user to the session.
		session.setAttribute("user", user);
		
		// A flash message will only show on the very next page. Then it will go away.
		// It is useful with redirects since you can't add attributes to the mav.
		redir.addFlashAttribute("message", "Logged in.");
		return new ModelAndView("redirect:/");
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session, RedirectAttributes redir) {
		// invalidate clears the current user session and starts a new one.
		session.invalidate();
		
		// A flash message will only show on the very next page. Then it will go away.
		// It is useful with redirects since you can't add attributes to the mav.
		redir.addFlashAttribute("message", "Logged out.");
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping("/signup")
	public ModelAndView showSignupForm() {
		return new ModelAndView("signup");
	}

	@PostMapping("/signup")
	public ModelAndView submitSignupForm(
			User user,
			@RequestParam("confirm-password") String confirmPassword, 
			HttpSession session, RedirectAttributes redir) {
		// Find the matching user.
		User existingUser = userDao.findByUsername(user.getUsername());
		if (existingUser != null) {
			// If user already exists, display an error message.
			return new ModelAndView("signup", "message", "A user with that username already exists.");
		}
		
		if (!confirmPassword.equals(user.getPassword())) {
			// If the user or passwords don't match, display an error message.
			return new ModelAndView("signup", "message", "Passwords do not match.");
		}
		
		userDao.create(user);
		
		// On successful sign-up, add the user to the session.
		session.setAttribute("user", user);
		
		// A flash message will only show on the very next page. Then it will go away.
		// It is useful with redirects since you can't add attributes to the mav.
		redir.addFlashAttribute("message", "Thanks for signing up!");
		return new ModelAndView("redirect:/");
	}

	// This is the second step in OAuth. After the user approves the login on the google site, it redirects back
	// to our site with a temporary code.
	@RequestMapping("/oauth2callback")
	public ModelAndView handleGoogleCallback(@RequestParam("code") String code, HttpSession session) {
		// First we must exchange that code for an access token.
		String accessToken = googleService.getGoogleAccessToken(code);
		// Then we can use that access token to get information about the user and other things.
		User googleUser = googleService.getUserFromGoogleApi(accessToken);

		// Check to see if the user is already in our database.
		User user = userDao.findByGoogleId(googleUser.getGoogleId());
		if (user == null) {
			// if not, add them.
			user = googleUser;
			userDao.create(user);
		}

		// Set the user on the session, just like the other type of login.
		session.setAttribute("user", user);
		// In some apps, you need the access token later, so throw that on the session, too.
		session.setAttribute("googleAccessToken", accessToken);

		return new ModelAndView("redirect:/");
	}

	

}
