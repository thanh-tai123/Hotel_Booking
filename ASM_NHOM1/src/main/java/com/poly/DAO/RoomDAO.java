package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.Entity.Report;
import com.poly.Entity.Room;


public interface RoomDAO extends JpaRepository<Room, Integer> {
	
	@Query("SELECT DISTINCT r.title FROM Room r")
    List<String> findAllRoomTitles();
	List<Room> findByPriceBetween(Double double1, Double double2);
	@Query("SELECT new Report(o.category, sum(o.price), count(o), "
		       + "sum(case when o.statusRoom = true then 1 else 0 end), "
		       + "sum(case when o.statusRoom = false then 1 else 0 end)) "
		       + "FROM Room o "
		       + "GROUP BY o.category "
		       + "ORDER BY sum(o.price) DESC")
		List<Report> getInventoryByCategory();
	@Query("select count(*)  from Room")
	Double getcount();

	List<Room> findByPriceBetweenAndCategoryName(double minPrice, double maxPrice, String categoryName);



}
