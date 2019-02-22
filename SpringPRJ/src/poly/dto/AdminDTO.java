package poly.dto;

public class AdminDTO {
	private String campus;
	private String name;
	private String menu_url;
	private String menu_type;
	private int hatred_limit;
	private String logo_url;
	
	

	public String getCampus() {
		return campus;
	}
	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}



	public void setCampus(String campus) {
		this.campus = campus;
	}



	public String getMenu_url() {
		return menu_url;
	}



	public void setMenu_url(String menu_url) {
		this.menu_url = menu_url;
	}



	public String getMenu_type() {
		return menu_type;
	}



	public void setMenu_type(String menu_type) {
		this.menu_type = menu_type;
	}



	public int getHatred_limit() {
		return hatred_limit;
	}



	public void setHatred_limit(int hatred_limit) {
		this.hatred_limit = hatred_limit;
	}

	public String getLogo_url() {
		return logo_url;
	}



	public void setLogo_url(String logo_url) {
		this.logo_url = logo_url;
	}


}
