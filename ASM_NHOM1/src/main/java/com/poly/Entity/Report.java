package com.poly.Entity;

import java.io.Serializable;



import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Report {
	@Id
	Serializable groupName;
	Double sum;
	Long count;
	Long countStatusRoomTrue;
    Long countStatusRoomFalse;
}
