package com.poly.Entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;
@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "ServiceRoom")
public class ServiceRoom implements Serializable{
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Integer idServiceRoom;

	    @ManyToOne
	    @JoinColumn(name = "IdUsers")
	    private User user;

	   
	  

	    @Column(name = "RoomService")
	    private Boolean roomService;

	    @Column(name = "LaundryService")
	    private Boolean laundryService;

	    @Column(name = "Airpot")
	    private Boolean airpot;

	    @Column(name = "Wakeup")
	    private Boolean wakeup;
}
