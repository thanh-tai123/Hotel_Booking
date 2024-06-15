package com.poly.Entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import lombok.*;
import org.hibernate.validator.constraints.NotBlank;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@SuppressWarnings("serial")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Getter
@Setter
@Table(name = "Users")
public class User implements Serializable{
	 	@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Integer idUsers;
	
	    @Column(name = "NameUsers")
	    private String nameUsers;
	
	    @Column(name = "PhoneNumber")
	    private String phoneNumber;
		
	    @Column(name = "Email")
	    private String email;
		
	    @Column(name = "PasswordUsers")
	    private String passwordUsers;
	
	    @Column(name = "Adress")
	    private String adress;
	
	    @Column(name = "CCCD")
	    private String cccd;
	    
	    @Column(name = "RoleE")
	    private Boolean roleE =false;
	    
	    @OneToMany(mappedBy = "user")
	    private List<Room> rooms;
	    
	    @OneToMany(mappedBy = "user")
	    private List<Bill> bills;
	    
	    @OneToMany(mappedBy = "user")
	    private List<ServiceRoom> serviceRooms;
	    @Column(name = "Activated")
	    private Boolean activated;

		  private LocalDateTime otpGeneratedTime;
		  private String otp;

	public boolean isRoleE() {
		return roleE;
	}
}
