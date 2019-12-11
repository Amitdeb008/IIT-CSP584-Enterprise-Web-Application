package com.dev.sportshub.dao;

import org.bson.Document;

import com.dev.sportshub.utils.MongoDBConnUtil;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class FeedbackDao {

	public void saveFeedback(String review, String userid, String eventId, String eventName) {
		MongoClient mongoClient = MongoDBConnUtil.getMongoConnection();
		// Accessing the database
		MongoDatabase database = mongoClient.getDatabase("sportshub");
		// Retrieving a collection
		MongoCollection<Document> collection = database.getCollection("feedback");
		System.out.println("Collection feedback selected successfully");
		Document document = new Document("title", "Feedback").append("feedback", review).append("by", userid).append("eventId", eventId).append("eventName", eventName);
		collection.insertOne(document);
		System.out.println("Document inserted successfully");
		mongoClient.close();
	}
}
