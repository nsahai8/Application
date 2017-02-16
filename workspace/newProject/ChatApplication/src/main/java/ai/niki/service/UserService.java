package ai.niki.service;

import java.io.Serializable;
import java.util.List;

import org.bson.types.ObjectId;

import ai.niki.domain.User;

public interface UserService extends AbstractDataService<User, ObjectId>{
	public List<User> getAllUsers();
	public Boolean isValidUser(String emailId);
}
