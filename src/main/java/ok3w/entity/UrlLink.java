package ok3w.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ok3w_link")
public class UrlLink {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int Lid;
	public int getLid() {
		return Lid;
	}
	public void setLid(int lid) {
		Lid = lid;
	}
	public String getLname() {
		return Lname;
	}
	public void setLname(String lname) {
		Lname = lname;
	}
	public String getLurl() {
		return Lurl;
	}
	public void setLurl(String lurl) {
		Lurl = lurl;
	}
	private String Lname;
	private String Lurl;
}
