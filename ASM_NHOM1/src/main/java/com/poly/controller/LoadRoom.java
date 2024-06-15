package com.poly.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.DAO.BillDAO;
import com.poly.DAO.RoomDAO;
import com.poly.Entity.Bill;
import com.poly.Entity.Room;
import com.poly.Entity.User;
import com.poly.service.SessionImp;

import jakarta.servlet.http.HttpSession;
@Controller
public class LoadRoom {
	@Autowired
	RoomDAO roomDao;
	@Autowired
	BillDAO billDao;
	@Autowired
	SessionImp session;
	

	@RequestMapping("/recept")
	public String Recept() {
		return "recept";
	}
	@RequestMapping("/room/index")
	public String paginate(Model model, @RequestParam("page") Optional<Integer> page) {
		
		Pageable pageable = PageRequest.of(page.orElse(0), 4);
		Page<Room> items = roomDao.findAll(pageable);
		model.addAttribute("page", items);
		//6
		Pageable pageable6 = PageRequest.of(page.orElse(1), 6);
		Page<Room> items6 = roomDao.findAll(pageable6);
		model.addAttribute("items6", items6);
		//4
		Pageable pageable4 = PageRequest.of(page.orElse(2), 4);
		Page<Room> items4 = roomDao.findAll(pageable4);
		model.addAttribute("items4", items4);
		 User user = (User) session.get("user");
		    if (user != null) {
		        model.addAttribute("username", user.getNameUsers());
		        model.addAttribute("isAdmin", user.isRoleE()); // Assuming User has isRoleE() method returning boolean
		    } else {
		        model.addAttribute("isAdmin", false);
		    }
		return "home";
		
	}
//	@RequestMapping("/room/index")
//	public String paginate(Model model, @RequestParam("page") Optional<Integer> page) {
//	    int currentPage = page.orElse(0);
//
//	    // Page size 4
//	    Pageable pageable4 = PageRequest.of(currentPage, 4);
//	    Page<Room> items4 = roomDao.findAll(pageable4);
//	    model.addAttribute("page4", items4);
//
//	    // Page size 6
//	    Pageable pageable6 = PageRequest.of(currentPage, 6);
//	    Page<Room> items6 = roomDao.findAll(pageable6);
//	    model.addAttribute("page6", items6);
//
//	    // Add the username to the model if the user is logged in
//	    User user = (User) session.get("user");
//	    if (user != null) {
//	        model.addAttribute("username", user.getNameUsers());
//	    }
//
//	    // Return the view name
//	    return "home";
//	}
	@RequestMapping("/room/detail")
	public String detail(Model model, @RequestParam("idPro") Integer id) {
		  Room item = roomDao.findById(id).orElse(null); 
	    model.addAttribute("item", item);
	    return "detail"; 
	}
	@RequestMapping("/room/home")
	public String home() {
		return "home";
	}
	  @GetMapping("/booking/update")
	    public String updateBooking(@RequestParam("idRooms") Integer idRooms) {
	        // Fetch the room from the database using the idRooms
	        Optional<Room> optionalRoom = roomDao.findById(idRooms);
	        if (optionalRoom.isPresent()) {
	            Room room = optionalRoom.get();
	           
	            room.setStatusRoom(true);
	            roomDao.save(room);
	        }

	        return "redirect:/recept";
	    }
	  @GetMapping("/room/booking")
	  public String showBookingForm(HttpSession session) {
	      if (session.getAttribute("username") != null) {
	          return "redirect:/pay"; // Redirect to payment page if logged in
	      } else {
	          return "redirect:/user/login"; // Redirect to login page if not logged in
	      }
	  }
//	  @RequestMapping("/bill")
//	  public String showBill() {
//		  return "bill";
//	  }
	  @GetMapping("/bill")
	  public String showBill(Model model,
	                         @RequestParam("idRooms") String idRooms,
	                         @RequestParam("amount") Float amount,
	                         @RequestParam("checkin") String checkin,
	                         @RequestParam("checkout") String checkout,
	                         @RequestParam("title") String title,
	                         @RequestParam("adress") String address,
	                         @RequestParam("roomNumber") String roomNumber,
	                         @RequestParam("roomType") String roomType,
	                         @RequestParam("bedType") String bedType) {
	      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	      LocalDate checkinDate;
	      LocalDate checkoutDate;
	      try {
	          checkinDate = LocalDate.parse(checkin, formatter);
	          checkoutDate = LocalDate.parse(checkout, formatter);
	      } catch (Exception e) {
	          model.addAttribute("error", "Invalid date format.");
	          model.addAttribute("idRooms", idRooms);  // Add idRooms to the model
	          return "search";
	      }
	      LocalDate today = LocalDate.now();
	      LocalDate minCheckinDate = today.plusDays(2);
	      LocalDate maxCheckoutDate = checkinDate.plusDays(14);

	      if (checkinDate.isBefore(today)) {
	          model.addAttribute("error", "Check-in date cannot be in the past. <a href=\"/room/detail?idPro=" + idRooms + "\">Reset</a>");
	          model.addAttribute("idRooms", idRooms);  // Add idRooms to the model
	          return "detail";
	      }

	      if (checkinDate.isBefore(minCheckinDate)) {
	          model.addAttribute("error", "Check-in date must be at least two days from today. <a href=\"/room/detail?idPro=" + idRooms + "\">Reset</a>");
	          model.addAttribute("idRooms", idRooms);  // Add idRooms to the model
	          return "detail";
	      }

	      if (checkoutDate.isBefore(checkinDate.plusDays(2))) {
	          model.addAttribute("error", "Check-out date must be at least two days after the check-in date. <a href=\"/room/detail?idPro=" + idRooms + "\">Reset</a>");
	          model.addAttribute("idRooms", idRooms);  // Add idRooms to the model
	          return "detail";
	      }

	      if (checkoutDate.isAfter(maxCheckoutDate)) {
	          model.addAttribute("error", "Check-out date cannot be more than 14 days after the check-in date. <a href=\"/room/detail?idPro=" + idRooms + "\">Reet</a>");
	          model.addAttribute("idRooms", idRooms);  // Add idRooms to the model
	          return "detail";
	      }

	      long numberOfDays = ChronoUnit.DAYS.between(checkinDate, checkoutDate);
	      Float totalAmount = numberOfDays * amount;

	      model.addAttribute("idRooms", idRooms);
	      model.addAttribute("pricePerDay", amount);
	      model.addAttribute("checkin", checkin);
	      model.addAttribute("checkout", checkout);
	      model.addAttribute("title", title);
	      model.addAttribute("adress", address);
	      model.addAttribute("roomNumber", roomNumber);
	      model.addAttribute("roomType", roomType);
	      model.addAttribute("bedType", bedType);
	      model.addAttribute("numberOfDays", numberOfDays);
	      model.addAttribute("Totalamount", totalAmount);

	      return "bill";
	  }

	  @RequestMapping("/room/search")
	  public String search(Model model, @RequestParam("min") Optional<Double> min,
	                       @RequestParam("max") Optional<Double> max) {

	      // Fetch rooms based on search criteria
	      List<Room> items = roomDao.findAll();
	      if (min.isPresent() && max.isPresent()) {
	          items = roomDao.findByPriceBetween(min.get(), max.get());
	      }

	      // Add the list of filtered rooms to the model attribute "pagex"
	      model.addAttribute("pagex", items);

	      // Return the view name for displaying search results
	      return "search";
	  }
	  @PostMapping("/submitBill")
	  public String submitBill(@ModelAttribute Bill bill, @RequestParam("idRooms") Integer idRooms, Model model) {
	      Room room = new Room();
	      room.setIdRooms(idRooms);
	      room.setStatusRoom(true);
	      bill.setRoom(room);
	      User user=new User();
	      
	      User u =(User)session.get("user");
	      user.setIdUsers(u.getIdUsers());
	      user.setNameUsers(u.getNameUsers());
	      bill.setUser(user);
//	      bill.setNameUser(u.getNameUsers());
//	      bill.setUser(User user);
	    // Assuming you have a setUser method in your Bill class
	      if ("Credit Card".equals(bill.getPaymentMethod())) {
	          // Redirect to the payment page
	          model.addAttribute("totalAmount", bill.getTotalAmount());
	          return "redirect:/pay?totalAmount=" + bill.getTotalAmount();
	      } else if ("Tien Mat".equals(bill.getPaymentMethod())) {
	          // Save the bill in the database immediately
	          billDao.save(bill);
	          return "redirect:/booking/update?idRooms=" + idRooms; // Replace with your confirmation page
	      } else {
	          // Handle invalid payment method scenario
	          return "redirect:/error"; // Replace with your error page
	      }
	  }





}
