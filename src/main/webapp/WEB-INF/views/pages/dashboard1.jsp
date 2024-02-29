<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="p-5">
	<div class="flex mt-8 space-x-10"
		style="justify-content: space-around; margin-top: 170px;">

		<!-- Card 1 -->
		<div class="w-1/4 bg-blue-500 p-4 rounded shadow-md mx-3 text-white">
			<h2 class="text-lg font-semibold mb-2">Loyer minimal</h2>
			<p class="">Loyer minimal</p>
			<p class="text-4xl font-bold mt-4">${requestScope.minRent}Ar</p>
		</div>

		<!-- Card 2 -->
		<div class="w-1/4 bg-green-500 p-4 rounded shadow-md mx-3 text-white">
			<h2 class="text-lg font-semibold mb-2">Loyer maximal</h2>
			<p class="">Loyer maximal</p>
			<p class="text-4xl font-bold mt-4">${requestScope.maxRent}Ar</p>
		</div>

		<!-- Card 3 -->
		<div class="w-1/4 bg-yellow-500 p-4 rounded shadow-md mx-3 text-white">
			<h2 class="text-lg font-semibold mb-2">Loyer total</h2>
			<p class="">Loyer total</p>
			<p class="text-4xl font-bold mt-4">${requestScope.totalRent}Ar</p>
		</div>

		<!-- Card 4 -->
		<div class="w-1/4 bg-pink-500 p-4 rounded shadow-md mx-3 text-white">
			<h2 class="text-lg font-semibold mb-2">Card 4</h2>
			<p class="">Description for Card 4</p>
			<p class="text-4xl font-bold mt-4">85%</p>
		</div>
	</div>

	<div style="" class="w-full flex justify-between space-x-5 ">
		<div class="w-1/2 p-5">
			<canvas id="barChart" class="w-full h-48 border rounded-lg"></canvas>
		</div>

		<div class="w-1/2 p-5">
			<canvas id="lineChart" class="w-full h-48 border rounded-lg"></canvas>
		</div>
	</div>
</div>
<script>
    var locations = <%=request.getAttribute("Locations")%>;

    var labels = locations.map(location => location.nameLocation);
    var dataValues = locations.map(location => location.tauxJournalier * location.nombreJours);

    var barChartData = {
        labels: labels,
        datasets: [{
            label: 'Loyer',
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1,
            data: dataValues
        }]
    };

    var barChartCtx = document.getElementById('barChart').getContext('2d');
    var barChart = new Chart(barChartCtx, {
        type: 'bar',
        data: barChartData
    });
    var lineChartLabels = locations.map(location => location.nameLocation);
    var lineChartDataValues = locations.map(location => location.tauxJournalier * location.nombreJours);

    var lineChartData = {
            labels: lineChartLabels,
            datasets: [{
                label: 'Loyer',
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 2,
                fill: false,
                data: lineChartDataValues
            }]
        };

        // Create line chart
        var lineChartCtx = document.getElementById('lineChart').getContext('2d');
        var lineChart = new Chart(lineChartCtx, {
            type: 'line',
            data: lineChartData
        });
</script>
