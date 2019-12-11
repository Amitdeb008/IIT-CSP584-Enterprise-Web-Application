package com.dev.sportshub.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.dev.sportshub.beans.Event;
import com.dev.sportshub.beans.Tickets;
import com.dev.sportshub.dao.EventsDao;

public class StubHubAPIHelper {

	public List<Event> getEventDataFromAPI() {
		List<Event> events = new ArrayList<>();
		try {
			URL url = new URL(
					"https://api.stubhub.com/sellers/search/events/v3?country=US&categoryName=Sports&rows=500&minAvailableTickets=1");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/json");
			conn.setRequestProperty("Authorization", "Bearer UTII17qeML6DZ0Tf5G8Ca3RTjkMg");
			conn.setConnectTimeout(5000);

			if (conn.getResponseCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
			}

			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

			String output;
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				System.out.println(output);
				JSONObject jsonObject = new JSONObject(output);
				JSONArray eventsJson = jsonObject.getJSONArray("events");
				for (int i = 0; i < eventsJson.length(); i++) {
					JSONObject eventJson = eventsJson.getJSONObject(i);
					String sportName = eventJson.getJSONObject("ancestors").getJSONArray("categories").getJSONObject(1)
							.getString("name");
					System.out.println(eventJson.getInt("id"));
					if (sportName.equals("Hockey") || sportName.equals("Basketball") || sportName.equals("Football")
							|| sportName.equals("Soccer") || sportName.equals("Baseball")
							|| sportName.equals("Volleyball")) {
						JSONObject venueJson = eventJson.getJSONObject("venue");
						String groupName = eventJson.getJSONObject("ancestors").getJSONArray("groupings")
								.getJSONObject(0).getString("name");

						Event event = new Event(String.valueOf(eventJson.getInt("id")), eventJson.getString("name"),
								sportName, groupName, eventJson.getString("eventDateLocal"),
								venueJson.getString("name"), venueJson.getString("city"), venueJson.getString("state"),
								venueJson.getString("postalCode"), "");
						events.add(event);
					}
				}
			}
			conn.disconnect();

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return events;
	}

	public List<Tickets> getTicketsListDataOfEvents() {
		List<Tickets> tickets = new ArrayList<>();
		try {
			int j =0;
			List<Event> events = new EventsDao().getAllEvents();
			for (Event event : events) {
				System.out.println(j++);
				URL url = new URL("https://api.stubhub.com/sellers/find/listings/v3?eventId=" + event.getEventId());
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Accept", "application/json");
				conn.setRequestProperty("Authorization", "Bearer UTII17qeML6DZ0Tf5G8Ca3RTjkMg");
				conn.setConnectTimeout(5000);

				if (conn.getResponseCode() != 200) {
					throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
				}

				BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

				String output;
				System.out.println("Output from Server .... \n");
				while ((output = br.readLine()) != null) {
					System.out.println(output);
					JSONObject jsonObject = new JSONObject(output);
					JSONArray listingsJson = jsonObject.getJSONArray("listings");
					for (int i = 0; i < listingsJson.length(); i++) {
						JSONObject listingJson = listingsJson.getJSONObject(i);
						System.out.println(listingJson.getInt("listingId"));

						String row = "";

						if (listingJson.has("row")) {
							row = listingJson.getString("row");
						}

						Tickets ticket = new Tickets(String.valueOf(listingJson.getInt("listingId")),
								event.getEventId(), listingJson.getJSONObject("pricePerProduct").getDouble("amount"),
								row, listingJson.getString("sectionName"));
						tickets.add(ticket);
					}
				}
				conn.disconnect();

			}

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return tickets;
	}

}
