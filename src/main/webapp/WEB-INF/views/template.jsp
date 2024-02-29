<%@ page import="com.service.ResponseApi"%>

<%@page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%--  <jsp:include page="/WEB-INF/views/components/taglibs.jsp" /> --%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>JSP L3 | <%=request.getAttribute("pageTitle")%>

</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/TAILWIND/tailwind-all.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/TAILWIND/tailwind-base.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/TAILWIND/tailwind-components.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/TAILWIND/tailwind-utilities.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/fontawesome/css/all.min.css" />
	<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/style.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/sweetalert2/dist/sweetalert2.min.css" />

</head>

<body style="background-color:;" class="bg-gray-200">
	<script
		src="<%=request.getContextPath()%>/assets/sweetalert2/dist/sweetalert2.all.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/chartjs/package/dist/chart.umd.js"></script>
	<jsp:include page="/WEB-INF/views/components/header.jsp" />
	<main id="content" class="w-full min-h-screen ">
		<jsp:include page="${pageContent}" />

	</main>

	<jsp:include page="/WEB-INF/views/components/modal.jsp" />
</body>
<%
// Récupérer l'objet depuis la session
ResponseApi responseApi = (ResponseApi)request.getSession().getAttribute("responseApi");

// Vérifier si l'objet est présent et contient un message
if (responseApi != null && responseApi.getMessage() != null && !responseApi.getMessage().isEmpty()) {
%>
<script>
    Swal.fire({
        title: "<%= responseApi.getResultMessage() %>",
        text: "<%= responseApi.getMessage() %>",
        icon: "<%= responseApi.getStatus() == 200 ? "success" : "error" %>"
    });
</script>
<%
    // Effacer l'objet de la session après utilisation
    request.getSession().removeAttribute("responseApi");
}
%>

</html>