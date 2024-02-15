<%@ page import="java.util.List"%>
<%@ page import="com.models.Location"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class=" w-full p-5 min-h-scren  ">
	<table style="margin-top: 170px;"
		class="w-full text-sm text-left mb-3  overflow-hidden shadow-md rounded-lg text-gray-500 dark:text-gray-400 bg-white">
		<thead class="text-xs text-white uppercase ">
			<tr class="bg-[] " style="background-color: #7E8A97;">
				<th scope="col" class="px-6 py-3">Nom du voiture</th>
				<th scope="col" class="px-6 py-3">Color</th>
				<th scope="col" class="px-6 py-3">Prix</th>
				<th scope="col" class="px-6 py-3">Stock</th>
				<th scope="col" class="px-6 py-3">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty Locations}">
					<c:forEach var="location" items="${Locations}">
						<tr
							class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
							<th scope="row"
								class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
								${location.getCarName()}</th>
							<td class="px-6 py-4">${location.getNameLocation()}</td>
							<td class="px-6 py-4">${location.getNombreJours()}</td>
							<td class="px-6 py-4">${location.getTauxJournalier()}</td>
							<td class="px-6 py-4">
								<button class="ml-2 text-red-500 hover:text-red-700"
									title="Delete" onclick="confirmDelete('${location.getId()}')">
									<i class="fas fa-trash"></i>
								</button>
								<button class="ml-2 text-yellow-500 hover:text-yellow-700"
									title="Update"
									onclick="openUpdateModal('${location.getId()}', '${location.getCarName()}', '${location.getNameLocation()}', ${location.getNombreJours()}, ${location.getTauxJournalier()})">
									<i class="fas fa-pencil-alt"></i>
								</button>
								<form id="deleteForm${location.getId()}"
									action="<%= request.getContextPath() %>/app" method="POST">
									<input type="hidden" name="action" value="delete"> <input
										type="hidden" name="id" value="${location.getId()}">
								</form>
							</td>
						</tr>

					</c:forEach>

					<script>
					
    function confirmDelete(locationId) {
        Swal.fire({
            title: 'Confirmer la suppression',
            text: 'Voulez-vous vraiment supprimer cette location?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Oui, supprimer!'
        }).then((result) => {
            if (result.isConfirmed) {
            	if (result.isConfirmed) {
                    // Soumettre le formulaire de suppression correspondant
                    document.getElementById('deleteForm' + locationId).submit();
                }
            }
        });
    }
</script>

				</c:when>
				<c:otherwise>
					<tr>
						<p class="p-10 w-full text-center ">Pas de donnés pour
							l'instant</p>
					</tr>
				</c:otherwise>
			</c:choose>

		</tbody>
	</table>
</div>

<jsp:include page="/WEB-INF/views/components/modalEdit.jsp" />
