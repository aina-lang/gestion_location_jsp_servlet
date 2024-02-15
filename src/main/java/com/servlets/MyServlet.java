package com.servlets;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

import com.models.Location;
import com.service.ResponseApi;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletRequest;
//import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet {

	private static final long serialVersionUID = 5472478352190366268L;
	ServletConfig con;
	private Location LocationModel = new Location();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		int linkActive = 0;
		if (requestURI.equals(req.getContextPath() + "/") || requestURI.equals(req.getContextPath() + "/jsp_l3/")
				|| requestURI.equals(req.getContextPath() + "/jsp_l3") || requestURI.endsWith("/app/")
				|| requestURI.endsWith("/app")) {

			req.setAttribute("linkActive", linkActive);
			viewAllLocations(req, res);

		} else if (requestURI.startsWith(req.getContextPath() + "/app/dashboard")
				|| requestURI.startsWith(req.getContextPath() + "/dashboard")) {
			linkActive = 1;
			req.setAttribute("linkActive", linkActive);
			getServletContext().getRequestDispatcher("/WEB-INF/views/pages/dashboard.jsp").forward(req, res);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");

		if (action != null && "delete".equals(action)) {
			deleteLocation(req, res);
		} else if (action != null && "update".equals(action)) {
			System.out.println("Method: " + req.getMethod());
			updateLocation(req, res);
		} else {
			addLocation(req, res);
		}

	}


	
	private void viewAllLocations(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Location> Locations = LocationModel.getAllLocations();
		System.out.println("YESSSSS");
		request.setAttribute("Locations", Locations);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	private void viewLocation(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String LocationId = request.getParameter("id");
		Location Location = LocationModel.getLocationById(LocationId);

		if (Location != null) {
			request.setAttribute("Location", Location);
			request.getRequestDispatcher("/WEB-INF/views/Locations/view.jsp").forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
	}

	private void addLocation(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    try {
	        // Récupérer les détails de la Location depuis le formulaire
	        String carName = request.getParameter("carName");
	        String nameLocation = request.getParameter("nameLocation");
	        int nombreJours = Integer.parseInt(request.getParameter("nombreJours"));
	        double tauxJournalier = Double.parseDouble(request.getParameter("tauxJournalier"));

	        // Créer une nouvelle instance de Location
	        Location newLocation = new Location();
	        newLocation.setCarName(carName);
	        newLocation.setNameLocation(nameLocation);
	        newLocation.setNombreJours(nombreJours);
	        newLocation.setTauxJournalier(tauxJournalier);

	        // Ajouter la nouvelle Location au modèle
	        LocationModel.addLocation(newLocation);

	        // Créer une réponse avec un message de succès
	        ResponseApi successResponse = new ResponseApi("Location ajoutée avec succès", 200, "Success");

	        request.getSession().setAttribute("responseApi", successResponse);
	        response.sendRedirect(request.getContextPath() + "/app");
	    } catch (NumberFormatException e) {
	        // Créer une réponse avec un message d'erreur
	        ResponseApi errorResponse = new ResponseApi("Erreur lors de l'ajout de la Location", 500, "Error");

	        request.getSession().setAttribute("responseApi", errorResponse);
	        response.sendRedirect(request.getContextPath() + "/app");
	    }
	}


	private void updateLocation(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    try {
	        String locationId = request.getParameter("id");
	        String carName = request.getParameter("carName");
	        String nameLocation = request.getParameter("nameLocation");
	        int nombreJours = Integer.parseInt(request.getParameter("nombreJours"));
	        double tauxJournalier = Double.parseDouble(request.getParameter("tauxJournalier"));

	        // Créer une nouvelle instance de Location
	        Location updatedLocation = new Location();
	        updatedLocation.setId(locationId);
	        updatedLocation.setCarName(carName);
	        updatedLocation.setNameLocation(nameLocation);
	        updatedLocation.setNombreJours(nombreJours);
	        updatedLocation.setTauxJournalier(tauxJournalier);

	        // Mettre à jour la Location dans le modèle
	        LocationModel.updateLocation(updatedLocation);

	        // Envoyer une réponse de succès
	        ResponseApi successResponse = new ResponseApi("La location a été mise à jour avec succès.", 200, "Success");
	        request.getSession().setAttribute("responseApi", successResponse);
	        // Rediriger pour afficher toutes les Locations
	        response.sendRedirect(request.getContextPath() + "/app");
	    } catch (NumberFormatException e) {
	        // Envoyer une réponse d'erreur si quelque chose se passe mal
	        ResponseApi errorResponse = new ResponseApi(
	                "Une erreur s'est produite lors de la mise à jour de la Location.", 500, "Error");
	        request.getSession().setAttribute("responseApi", errorResponse);
	        response.sendRedirect(request.getContextPath() + "/app");
	    }
	}


//	private void sendJsonResponse(HttpServletResponse response, ResponseApi responseObject) throws IOException {
//	    response.setContentType("application/json");
//	    response.setCharacterEncoding("UTF-8");
//	    PrintWriter writer = response.getWriter();
//	    writer.write(new Gson().toJson(responseObject));
//	    writer.flush();
//	}

	private void deleteLocation(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String locationId = request.getParameter("id");

		// Vérifier si l'ID de la location est fourni
		if (locationId != null && !locationId.isEmpty()) {
			// Appeler la méthode de suppression dans votre modèle ou service
			LocationModel.deleteLocation(locationId);

			// Mettre à jour le modèle de réponse avec un message de succès
			ResponseApi successResponse = new ResponseApi("La location a été supprimée avec succès.", 200, "Success");
			request.getSession().setAttribute("responseApi", successResponse);
		} else {
			// Mettre à jour le modèle de réponse avec un message d'échec
			ResponseApi errorResponse = new ResponseApi("Erreur lors de la suppression de la location.", 500, "Error");
			request.getSession().setAttribute("responseApi", errorResponse);
		}

		// Rediriger vers la page appropriée
		response.sendRedirect(request.getContextPath() + "/app");
	}

}
