package com.models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.service.MyConnexion;

public class Location {

	private List<Location> locations = new ArrayList<>();

	private String id;
	private String nameLocation; 
	private String carName;
	private int nombreJours; 
	private double tauxJournalier; 

	// Create (C) - Add a new Location
	public void addLocation(Location location) {
		try (Connection connection = MyConnexion.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"INSERT INTO locations (nameLocation, car_name, nombre_jours, taux_journalier) VALUES (?, ?, ?, ?)")) {

			preparedStatement.setString(1, location.getNameLocation());
			preparedStatement.setString(2, location.getCarName());
			preparedStatement.setInt(3, location.getNombreJours());
			preparedStatement.setDouble(4, location.getTauxJournalier());

			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Read (R) - Get all locations
	public List<Location> getAllLocations() {
		try (Connection connection = MyConnexion.getConnection();
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery("SELECT * FROM locations")) {

			List<Location> locations = new ArrayList<>();
			while (resultSet.next()) {
				Location location = new Location();
				location.setId(resultSet.getString("id"));
				location.setNameLocation(resultSet.getString("nameLocation"));
				location.setCarName(resultSet.getString("car_name"));
				location.setNombreJours(resultSet.getInt("nombre_jours"));
				location.setTauxJournalier(resultSet.getDouble("taux_journalier"));
				locations.add(location);
			}
			return locations;

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	// Update (U) - Update a Location
	public void updateLocation(Location updatedLocation) {
		try (Connection connection = MyConnexion.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"UPDATE locations SET nameLocation = ?, car_name = ?, nombre_jours = ?, taux_journalier = ? WHERE id = ?")) {

			preparedStatement.setString(1, updatedLocation.getNameLocation());
			preparedStatement.setString(2, updatedLocation.getCarName());
			preparedStatement.setInt(3, updatedLocation.getNombreJours());
			preparedStatement.setDouble(4, updatedLocation.getTauxJournalier());
			preparedStatement.setString(5, updatedLocation.getId());

			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Delete (D) - Delete a Location by ID
	public void deleteLocation(String id) {
		try (Connection connection = MyConnexion.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("DELETE FROM locations WHERE id = ?")) {

			preparedStatement.setString(1, id);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Read (R) - Get a Location by ID
	public Location getLocationById(String id) {
		try (Connection connection = MyConnexion.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM locations WHERE id = ?")) {

			preparedStatement.setString(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				Location location = new Location();
				location.setId(resultSet.getString("id"));
				location.setNameLocation(resultSet.getString("nameLocation"));
				location.setCarName(resultSet.getString("car_name"));
				location.setNombreJours(resultSet.getInt("nombre_jours"));
				location.setTauxJournalier(resultSet.getDouble("taux_journalier"));
				return location;
			} else {
				return null;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	// Getters and setters

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNameLocation() {
		return nameLocation;
	}

	public void setNameLocation(String nameLocation) {
		this.nameLocation = nameLocation;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public int getNombreJours() {
		return nombreJours;
	}

	public void setNombreJours(int nombreJours) {
		this.nombreJours = nombreJours;
	}

	public double getTauxJournalier() {
		return tauxJournalier;
	}

	public void setTauxJournalier(double tauxJournalier) {
		this.tauxJournalier = tauxJournalier;
	}
}
