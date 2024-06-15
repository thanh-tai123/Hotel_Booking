package com.poly.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.*;

import java.time.LocalDate;

@Entity
@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReportBill {
	@Id
    private int idBill;
    private String nameUsers;
    private String phoneNumber;
    private String roomNumber;
    private String roomType;
    private String checkIn;
    private String checkOut;
    private Float totalAmount;

}
