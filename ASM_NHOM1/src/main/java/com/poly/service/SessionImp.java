package com.poly.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.poly.model.*;

import jakarta.servlet.http.HttpSession;



@Service
public class SessionImp implements SessionService {
//	public static List<Session> listSession=new ArrayList<>();
//	@Override
//	public Object get(String key) {
//		Object value = null;
//		if(key.isEmpty()||key=="") {
//			return null;
//		}
//		for(Session item:listSession) {
//			if(key.equalsIgnoreCase(item.getKey())) {
//				value=item.getValue();
//			}
//		}
//		return value;
//	}
//
//	@Override
//	public void set(String key, Object value) {
//		for(int i=0;i<listSession.size();i++) {
//			Session item=listSession.get(i);
//			if(key.equalsIgnoreCase(item.getKey())) {
//				listSession.remove(i);
//			}
//		}
//		Session session=new Session();
//		session.setKey(key);
//		session.setValue(value);
//		listSession.add(session);
//	}
//
//	@Override
//	public void remove(String key) {
//		// TODO Auto-generated method stub
//		
//	}	
	

	   public static List<Session> listSession = new ArrayList<>();

	    @Override
	    public Object get(String key) {
	        if (key == null || key.isEmpty()) {
	            return null;
	        }
	        for (Session item : listSession) {
	            if (key.equalsIgnoreCase(item.getKey())) {
	                return item.getValue();
	            }
	        }
	        return null;
	    }

	    @Override
	    public void set(String key, Object value) {
	        listSession.removeIf(item -> key.equalsIgnoreCase(item.getKey()));
	        Session session = new Session();
	        session.setKey(key);
	        session.setValue(value);
	        listSession.add(session);
	    }

		@Override
		public void remove(String key) {
			// TODO Auto-generated method stub
			
		}
}
