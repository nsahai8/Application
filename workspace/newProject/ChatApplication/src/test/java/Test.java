import java.net.UnknownHostException;

import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import com.mongodb.MongoClient;

import ai.niki.domain.User;

public class Test {
	public static final String DB_NAME = "assortment";
	public static final String PERSON_COLLECTION = "user";
	public static final String MONGO_HOST = "localhost";
	public static final int MONGO_PORT = 27017;

	public static void main(String[] args) {
		try {
			MongoClient mongo = new MongoClient(MONGO_HOST, MONGO_PORT);
			MongoOperations mongoOps = new MongoTemplate(mongo, DB_NAME);
			User user = new User();
			user.setEmailId("abc@gmail.com");
			user.setName("abc");
			mongoOps.insert(user, PERSON_COLLECTION);
			mongo.close();

		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
	}

}
