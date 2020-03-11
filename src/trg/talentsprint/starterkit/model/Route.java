package trg.talentsprint.starterkit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "route")
public class Route {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String routename;
	private String category;
	private String keyword;
	private String rdescription;
	private String fromaddress;
	private String toaddress;
	private String ilocation;
	private String iname;
	private String idescription;
	private String user;
	private String path;
	private int rating;
	private String comment;

	public Route() {
		super();
	}

	public Route(String routename, String category, String keyword, String rdescription, String fromaddress,
			String toaddress, String ilocation, String iname, String idescription, String user, String path) {
		super();
		this.routename = routename;
		this.category = category;
		this.keyword = keyword;
		this.rdescription = rdescription;
		this.fromaddress = fromaddress;
		this.toaddress = toaddress;
		this.ilocation = ilocation;
		this.iname = iname;
		this.idescription = idescription;
		this.user = user;
		this.path = path;
	}

	public Route(String user) {
		super();
		this.user = user;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRoutename() {
		return routename;
	}

	public void setRoutename(String routename) {
		this.routename = routename;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getRdescription() {
		return rdescription;
	}

	public void setRdescription(String rdescription) {
		this.rdescription = rdescription;
	}

	public String getFromaddress() {
		return fromaddress;
	}

	public void setFromaddress(String fromaddress) {
		this.fromaddress = fromaddress;
	}

	public String getToaddress() {
		return toaddress;
	}

	public void setToaddress(String toaddress) {
		this.toaddress = toaddress;
	}

	public String getIlocation() {
		return ilocation;
	}

	public void setIlocation(String ilocation) {
		this.ilocation = ilocation;
	}

	public String getIname() {
		return iname;
	}

	public void setIname(String iname) {
		this.iname = iname;
	}

	public String getIdescription() {
		return idescription;
	}

	public void setIdescription(String idescription) {
		this.idescription = idescription;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	

}