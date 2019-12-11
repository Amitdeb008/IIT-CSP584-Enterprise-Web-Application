package com.dev.sportshub.utils;

import com.mongodb.MongoClient;
import com.mongodb.MongoCredential;

public class MongoDBConnUtil {

	@SuppressWarnings({ "rawtypes", "unused" })
	public static MongoClient getMongoConnection() {
		 // Creating a Mongo client 
	      MongoClient mongo = new MongoClient( "localhost" , 27017 ); 

	      // Creating Credentials 
	      MongoCredential credential; 
	      credential = MongoCredential.createCredential("root", "sportshub", 
	         "root".toCharArray());
	      System.out.println("Connected to the database successfully");  
	      return mongo;
	}
	
}
