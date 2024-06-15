package com.poly.Entity;

import java.io.Serializable;
import java.util.List;

import org.hibernate.annotations.ManyToAny;



import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;
@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Rooms")
public class Room implements Serializable{
	 @Id
	   @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "IdRooms", length = 50) // Specify length
	    private Integer idRooms;

	    @ManyToOne
	    @JoinColumn(name = "IdUsers")
	    private User user;

	    @Column(name = "Title")
	    private String title;
	    
	    @Column(name = "Img")
	    private String img;
	    
	    @Column(name = "Adress")
	    private String adress;
	    
	    @Column(name = "RoomNumber")
	    private String roomNumber;

	    @Column(name = "RoomType")
	    private String roomType;

	    @Column(name = "BedType")
	    private String bedType;

	    @Column(name = "Price")
	    private Float price;

	    @Column(name = "StatusRoom")
	    private Boolean statusRoom;

	    @Column(name = "Checkin")
	    private String checkin;

	    @Column(name = "Checkout")
	    private String checkout;

	    @Column(name = "DescriptionRooms")
	    private String descriptionRooms;
	    
	    @ManyToOne
		@JoinColumn(name = "Categoryid")
		Category category;
}
