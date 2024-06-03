package customer.bean;

import java.io.Serializable;

public class Customer implements Serializable {
    private static long serialVersionUID = 1l;
    private String firstname;
    private String lastname;
    private String username;
    private String password;
    private String address;
    private int mobilenum;
   
    public static long getSerialversionuid() {
		return serialVersionUID+1;
	}
	public String getFirstName() {
        return firstname;
    }
    public void setFirstName(String firstName) {
        this.firstname = firstName;
    }
    public String getLastName() {
        return lastname;
    }
    public void setLastName(String lastName) {
        this.lastname = lastName;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public int getMobilenum() {
        return mobilenum;
    }
    public void setMobilenum(int mobilenum) {
        this.mobilenum = mobilenum;
    }
}