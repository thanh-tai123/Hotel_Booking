package com.poly.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import com.poly.DAO.BillDAO;
import com.poly.Entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.poly.DAO.CategoryDAO;
import com.poly.DAO.RoomDAO;
import com.poly.DAO.UserDAO;
import com.poly.service.SessionImp;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class Admin {
    @Autowired
    ServletContext app;
    @Autowired
    CategoryDAO caDao;
    @Autowired
    SessionImp session;
    @Autowired
    UserDAO userDAO;
    @Autowired
    BillDAO billDAO;

    @RequestMapping("/admin")
    public String admin(Model model) {
        Room r = new Room();
        model.addAttribute("r", r);
        List<Category> categories = caDao.findAll();
        List<Report> items = roomDao.getInventoryByCategory();
        model.addAttribute("items", items);
        model.addAttribute("categories", categories);
        List<User> users = userDAO.findAll();
        model.addAttribute("users", users);
        // Retrieve user from session
        User user = (User) session.get("user");
        if (user != null) {
            model.addAttribute("username", user.getNameUsers());  // Assuming User has getUsername() method
        }
        Double countUser = userDAO.getcount();
        model.addAttribute("countUser", countUser);
        Double countRoom = roomDao.getcount();
        model.addAttribute("countRoom", countRoom);
        Double countBill = billDAO.getcount();
        model.addAttribute("countBill", countBill);

//	    return "admin/quanli";
        return "admin/admin";
    }
    @RequestMapping("/admin/manager")
    public String adminManage(Model model) {
        Room r = new Room();
        model.addAttribute("r", r);
        List<Category> categories = caDao.findAll();
        List<Report> items = roomDao.getInventoryByCategory();
        model.addAttribute("items", items);
        model.addAttribute("categories", categories);
        List<User> users = userDAO.findAll();
        model.addAttribute("users", users);
        // Retrieve user from session
        User user = (User) session.get("user");
        if (user != null) {
            model.addAttribute("username", user.getNameUsers());  // Assuming User has getUsername() method
        }
//        Double countUser = userDAO.getcount();
//        model.addAttribute("countUser", countUser);
//        Double countRoom = roomDao.getcount();
//        model.addAttribute("countRoom", countRoom);
//        Double countBill = billDAO.getcount();
//        model.addAttribute("countBill", countBill);

	    return "admin/quanli";
//        return "admin/admin";
    }

    @Autowired
    RoomDAO roomDao;

    @Autowired
    UserDAO userDao;

    //	@RequestMapping("/room/save")
//	public String dangky(@Valid @ModelAttribute("r") Room r ,Model model, BindingResult result) {
//		
//		model.addAttribute("roomSave", r);
//		return "admin/quanli";
//	}
    @RequestMapping(value = "/room/create", method = RequestMethod.POST)
    public String save(@Valid @ModelAttribute("r") Room r, BindingResult result,
                       @RequestParam("photo") MultipartFile photo,
                       @RequestParam("title") String title,
                       @RequestParam("category.id") String categoryId, Model model) throws IllegalStateException, IOException {
        if (result.hasErrors()) {
            model.addAttribute("message", "Please fix the errors in the form");
            return "admin/quanli";
        } else if (photo.isEmpty()) {
            model.addAttribute("message_img", "Please select a photo");
            return "admin/quanli";
        } else {
            String filename = photo.getOriginalFilename();

            // Define the directory to save the file
            String uploadDir = "E:\\Java5_Spring"; // Update this to a valid directory path on your system
            File uploadDirFile = new File(uploadDir);

            // Create the directory if it does not exist
            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdirs();
            }

            File file = new File(uploadDirFile, filename);
            photo.transferTo(file);
            r.setImg(filename);

            // Find the selected category by ID
            Optional<Category> selectedCategoryOptional = caDao.findById(categoryId);
            if (selectedCategoryOptional.isPresent()) {
                Category selectedCategory = selectedCategoryOptional.get();
                // Set the title from the selected category
                r.setTitle(title);
                roomDao.save(r);
                return "redirect:/room/index";
            } else {
                model.addAttribute("message", "Selected category not found");
                return "admin/quanli";
            }
        }
    }

    @GetMapping("admin/viewuser")
    public String viewuser(Model model) {
        List<User> users = userDAO.findAll();
        model.addAttribute("users", users);


        return "admin/viewUser";
    }

    @GetMapping("admin/viewroom")
    public String viewroom(Model model, @ModelAttribute("r") Room r) {

        List<Room> rooms = roomDao.findAll();
        List<Category> categories = caDao.findAll();
        model.addAttribute("categories", categories);
        model.addAttribute("rooms", rooms);

        return "admin/viewRoom";
    }

    @GetMapping("admin/viewbill")
    public String viewbill(Model model) {
        List<Bill> bills = billDAO.findAll();
        model.addAttribute("bills", bills);
        List<ReportBill> reportbill=billDAO.getReports();
        model.addAttribute("reportbill", reportbill);
        return "admin/viewBill";
    }


}
