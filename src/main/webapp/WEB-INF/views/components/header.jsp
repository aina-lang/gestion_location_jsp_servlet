<header>
	<nav class="px-4 lg:px-6 py-3 fixed w-full shadow-md z-50"
		style="background-color: #30475E;">
		<div
			class="flex flex-wrap justify-between items-center mx-auto max-w-screen-xl">
			<a href="/JspL3/" class="flex items-center"> <span
				class="self-center text-xl font-semibold whitespace-nowrap text-white">SIFAKA
					RIDER</span>
			</a>
			<div class="flex items-center lg:order-2">
				<a href="#"
					class="text-white hover:bg-gray-50 focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 mr-2 dark:hover:bg-gray-700 focus:outline-none dark:focus:ring-gray-800">Log
					in </a>

				<button data-collapse-toggle="mobile-menu-2" type="button"
					class="inline-flex items-center p-2 ml-1 text-sm text-gray-500 rounded-lg lg:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
					aria-controls="mobile-menu-2" aria-expanded="false">
					<span class="sr-only">Open main menu</span>
					<svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
						xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
							d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
							clip-rule="evenodd"></path>
                    </svg>
					<svg class="hidden w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
						xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
							d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
							clip-rule="evenodd"></path>
                    </svg>
				</button>
			</div>

		</div>
	</nav>
</header>

<div style="position: fixed; top: 30px;"
	class="fixed px-3 w-full mb-10 left-0 justify-between items-start flex flex-row pt-20"
	id="mobile-menu-2">
	<ul class="flex flex-row mt-4 font-medium w-24">
		<li class="mx-2"><a href="<%=application.getContextPath()%>/app"
			class="block py-2 pr-4 pl-3 text-white flex justify-between items-center text-left rounded w-full hover:bg-teal-700 shadow-md dark:text-white dark:hover:bg-gray-700"
			aria-current="page"
			style="<%=request.getAttribute("linkActive").equals(0) ? "background-color: #30475E;" : "background-color:#7E8A97;"%>">
				<i class="fa fa-car mr-1"></i>Location
		</a></li>
		<li class="mx-2 "><a
			href="<%=application.getContextPath()%>/app/dashboard"
			class="block py-2 pr-4 pl-3 text-white w-full flex items-center text-left rounded  hover:bg-teal-700 shadow-md dark:text-white"
			aria-current="page"
			style="<%=request.getAttribute("linkActive").equals(1) ? "background-color: #30475E;" : "background-color:#7E8A97;"%>">
				<i class="fa fa-gauge mr-1"></i>Dashboard
		</a></li>
	</ul>
	<div class="py-4">
		<button id="openModalBtn1"
			class="mx-3 bg-blue-500 py-3 text-sm px-3 text-white rounded hover:bg-blue-700">
			<i class="fa fa-add mr-1"></i>
			Ajouter une voiture</button>
	</div>
</div>
