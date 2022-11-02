package com.Model;

import java.io.Serializable;
import jakarta.persistence.*;
import java.sql.Date;
import java.util.List;

/**
 * The persistent class for the PRODUCT database table.
 * 
 */
@Entity
@Table(name = "PRODUCT")
@NamedQueries({ @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p"),
		@NamedQuery(name = "Product.findTop4ProductByCategory", query = "SELECT p FROM Product p where p.category like :category ORDER BY p.productid LIMIT 4"),
		@NamedQuery(name = "Product.countProduct", query = "SELECT count(p) FROM Product p"),
		@NamedQuery(name = "Product.findAllLikeByUser", query = "SELECT l.product FROM Like l WHERE l.user.username=:username"),
		@NamedQuery(name = "Product.countFavoriteProduct", query = "SELECT count(l.product) FROM Like l WHERE l.user.username=:username") })
@NamedStoredProcedureQueries({
		@NamedStoredProcedureQuery(name = "Product.findTop3Product", procedureName = "sp_FindTop3Product", resultClasses = Product.class) })
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "PRODUCTID")
	private String productid;

	@Column(name = "CATEGORY")
	private String category;

	@Column(name = "COLOR")
	private String color;

	@Column(name = "COMPANY")
	private String company;

	@Column(name = "[DATE]")
	private Date date;

	@Column(name = "[DESCRIBE]")
	private String describe;

	@Column(name = "IMAGE_MAIN")
	private String imageMain;

	@Column(name = "IMAGE1")
	private String image1;

	@Column(name = "IMAGE2")
	private String image2;

	@Column(name = "IMAGE3")
	private String image3;

	@Column(name = "IMAGE4")
	private String image4;

	@Column(name = "NAME")
	private String name;

	@Column(name = "OLDPRICE")
	private Long oldprice;

	@Column(name = "PRICE")
	private Long price;

	@Column(name = "QUANTITY")
	private int quantity;

	@Column(name = "SALE")
	private int sale;

	@Column(name = "STATUS")
	private boolean status;

	@Column(name = "VIDEO")
	private String video;

	// bi-directional many-to-one association to Like
	@OneToMany(mappedBy = "product")
	private List<Like> likes;

	// bi-directional many-to-one association to Orderdetail
	@OneToMany(mappedBy = "product")
	private List<Orderdetail> orderdetails;

	// bi-directional many-to-one association to Specification
	@ManyToOne
	@JoinColumn(name = "SPECIFICATION_ID")
	private Specification specification;

	// bi-directional many-to-one association to Share
	@OneToMany(mappedBy = "product")
	private List<Share> shares;

	public Product() {
	}

	public String getProductid() {
		return this.productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getColor() {
		return this.color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getCompany() {
		return this.company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getDescribe() {
		return this.describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getImageMain() {
		return this.imageMain;
	}

	public void setImageMain(String imageMain) {
		this.imageMain = imageMain;
	}

	public String getImage1() {
		return this.image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return this.image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return this.image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getImage4() {
		return image4;
	}

	public void setImage4(String image4) {
		this.image4 = image4;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getOldprice() {
		return this.oldprice;
	}

	public void setOldprice(Long oldprice) {
		this.oldprice = oldprice;
	}

	public Long getPrice() {
		return this.price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getSale() {
		return this.sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}

	public boolean getStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getVideo() {
		return this.video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public List<Like> getLikes() {
		return this.likes;
	}

	public void setLikes(List<Like> likes) {
		this.likes = likes;
	}

	public Like addLike(Like like) {
		getLikes().add(like);
		like.setProduct(this);

		return like;
	}

	public Like removeLike(Like like) {
		getLikes().remove(like);
		like.setProduct(null);

		return like;
	}

	public List<Orderdetail> getOrderdetails() {
		return this.orderdetails;
	}

	public void setOrderdetails(List<Orderdetail> orderdetails) {
		this.orderdetails = orderdetails;
	}

	public Orderdetail addOrderdetail(Orderdetail orderdetail) {
		getOrderdetails().add(orderdetail);
		orderdetail.setProduct(this);

		return orderdetail;
	}

	public Orderdetail removeOrderdetail(Orderdetail orderdetail) {
		getOrderdetails().remove(orderdetail);
		orderdetail.setProduct(null);

		return orderdetail;
	}

	public Specification getSpecification() {
		return this.specification;
	}

	public void setSpecification(Specification specification) {
		this.specification = specification;
	}

	public List<Share> getShares() {
		return this.shares;
	}

	public void setShares(List<Share> shares) {
		this.shares = shares;
	}

	public Share addShare(Share share) {
		getShares().add(share);
		share.setProduct(this);

		return share;
	}

	public Share removeShare(Share share) {
		getShares().remove(share);
		share.setProduct(null);

		return share;
	}

}