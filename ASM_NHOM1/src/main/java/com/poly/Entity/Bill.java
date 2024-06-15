package com.poly.Entity;

import java.io.Serializable;

import java.util.Date;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;
@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Bill")
public class Bill implements Serializable{
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "IdBill", length = 15)
	    private Integer idBill;

	    @ManyToOne
	    @JoinColumn(name = "IdUsers")
	    private User user;

	    // Specify the same length and column name
	    @ManyToOne
	    @JoinColumn(name = "IdRooms", referencedColumnName = "IdRooms")
	    private Room room;
	    
	    @Column(name = "TotalAmount")
	    private Float totalAmount;

	    @Column(name = "PaymentMethod")
	    private String paymentMethod;

	    @Column(name = "Title")
	    private String title;
	    
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

	    @Column(name = "DayNumber")
	    private int dayNumber;

	    @Column(name = "Checkin")
	    private String checkin;

	    @Column(name = "Checkout")
	    private String checkout;

	    @Column(name = "Note")
	    private String note;

	    @Column(name = "NameUser")
	    private String nameUser;
}
