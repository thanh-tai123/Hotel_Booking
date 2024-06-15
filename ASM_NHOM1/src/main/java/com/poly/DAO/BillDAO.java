package com.poly.DAO;

import com.poly.Entity.ReportBill;
import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.Entity.Bill;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface BillDAO extends JpaRepository<Bill, Integer> {


    @Query("select count(*)  from Bill")
    Double getcount();



    @Query(value = "SELECT new ReportBill(b.idBill, u.nameUsers, u.phoneNumber," +
            " b.roomNumber, b.roomType, b.checkin, b.checkout, b.totalAmount) " +
            "FROM Bill b " +
            "JOIN b.user u " +
            "JOIN b.room r")
    List<ReportBill> getReports();

}
