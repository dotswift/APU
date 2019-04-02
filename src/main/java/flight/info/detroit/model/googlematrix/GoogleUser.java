package flight.info.detroit.model.googlematrix;

import flight.info.detroit.User;

public class GoogleUser {
	private Long id;
	private String name;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void copyToUser(User user) {
		user.setGoogleId(id);
		user.setName(name);
	}

}
