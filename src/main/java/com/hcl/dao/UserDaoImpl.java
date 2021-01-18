package com.hcl.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hcl.model.User;

@Service
@Transactional
public class UserDaoImpl {
	@Autowired
	private UserDao userDao;
	
	public List<User> loadUser() {
		List<User> list = (List<User>) userDao.findAll();
		return list;
	}
	
	public boolean registerUser(String uname, String password) {
		User u = new User();
		u.setUname(uname);
		u.setPassword(password);
		
	
		long checker = this.loadUser().stream().filter(e -> e.getUname().equalsIgnoreCase(uname)).count();
		if (checker > 0) { // if username exists
			return false;
		}
		
		userDao.save(u);
		return true;
	}
	public boolean loginUser(String uname, String password) {
		List<User> list = this.loadUser();
		
		Optional<User> u = this.loadUser().stream().filter(e -> e.getUname().equalsIgnoreCase(uname) &&
				e.getPassword().equalsIgnoreCase(password)).limit(1).findFirst();
		if (u.isPresent())
			return true;
		
//		for (User u : list) {
//			if (u.getUname().equalsIgnoreCase("uname") && u.getPassword().equalsIgnoreCase(password)) {
//				return true;
//			}
//		}
		
		
		
		return false;
	}
	
	
}
