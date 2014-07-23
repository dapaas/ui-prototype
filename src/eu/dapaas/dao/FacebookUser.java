package eu.dapaas.dao;

public class FacebookUser {
	private String id;
	private String email;
	private String firstname;
	private String lastname;
	/* private String fullname; */
	private String profilePicLink;

	/*
	 * private String gender; private String birthday; private String language;
	 */

	public FacebookUser(String id, String email, String firstname,
			String lastname, String profilePicLink) {
		this.id = id;
		this.email = email;
		this.firstname = firstname;
		this.setLastname(lastname);
		/* this.fullname = fullname; */
		this.profilePicLink = profilePicLink;
		/*
		 * this.gender = gender; this.language = language;
		 */
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getProfilePicLink() {
		return profilePicLink;
	}

	public void setProfilePicLink(String profilePicLink) {
		this.profilePicLink = profilePicLink;
	}

}
