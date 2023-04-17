package com.example.tracker.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.example.tracker.models.LoginUser;
import com.example.tracker.models.User;
import com.example.tracker.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	public User register(User newUser, BindingResult result) {
		Optional<User> potentialUser = userRepository.findByEmail(newUser.getEmail());
		if(potentialUser.isPresent()) {
			result.rejectValue("email", "error.email", "Email address already in use...Do you have an account?");
		}
		if(!newUser.getPassword().equals(newUser.getConfirmPassword())) {
		    result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
		}
		if(result.hasErrors()) {
			return null;
		}
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		return userRepository.save(newUser);
		
	}
	
	// ==========================
    //        LOGIN
    // ==========================
 
    public User login(LoginUser newLogin, BindingResult result) {
        if(result.hasErrors()) {
            return null;
        }
        Optional<User> potentialUser = userRepository.findByEmail(newLogin.getEmail());
        if(!potentialUser.isPresent()) {
            result.rejectValue("email", "Unique", "Unknown email!");
            return null;
        }
        User user = potentialUser.get();
        if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
            result.rejectValue("password", "Matches", "Invalid Password!");
        }
        if(result.hasErrors()) {
            return null;
        } else {
            return user;
        }
    }
    
  //find one User
  	public User findUser(Long id) {
  		Optional<User> optionalUser = userRepository.findById(id);
  		if(optionalUser.isPresent()) {
  			return optionalUser.get();
  		}else {
  			return null;
  		}
  	}
  	
	// Update
	public User updateOne(User user) {
		return userRepository.save(user);
	}
	
	// Delete
	public void deleteOne(Long id) {
		userRepository.deleteById(id);
	}
}
