<style>
    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

    .fade-enter-active {
        animation: fadeIn 0.5s;
    }
</style>

<div id="modal-background" style="background-color: rgba(39, 38, 38, 0.445); z-index: 9999;"
    class="hidden flex fade-enter-active items-center justify-center w-full h-screen fixed top-0 left-0">
    <div id="modal" class="bg-white shadow-md rounded-lg p-5" style="width: 60%; height: auto;">
        <div class="w-full text-right">
            <button id="closeModalBtn">
                <i class="fa-solid fa-circle-xmark fa-beat"></i>
            </button>
        </div>

        <form class="mt-4" method="POST" action="<%=application.getContextPath()%>/app">
            <input type="hidden" name="action" value="update">
            <input type="hidden" id="locationId" name="id" value=""> 
            <label for="carName" class="block text-sm font-medium text-gray-700">Nom du voiture</label> 
            <input type="text" id="carName" name="carName" class="mt-1 p-2 border rounded-md w-full">
            
            <label for="nameLocation" class="block mt-4 text-sm font-medium text-gray-700">Nom de l'emplacement</label>
            <input type="text" id="nameLocation" name="nameLocation" class="mt-1 p-2 border rounded-md w-full">

            <label for="nombreJours" class="block mt-4 text-sm font-medium text-gray-700">Nombre de jours</label>
            <input type="number" id="nombreJours" name="nombreJours" class="mt-1 p-2 border rounded-md w-full">

            <label for="tauxJournalier" class="block mt-4 text-sm font-medium text-gray-700">Taux journalier</label>
            <input type="number" id="tauxJournalier" name="tauxJournalier" class="mt-1 p-2 border rounded-md w-full">

            <div class="mt-4">
                <button type="submit" class="mt-1 p-2 bg-blue-500 rounded w-full text-white">Enregistrer</button>
            </div>
        </form>
    </div>
</div>

<script>
    const modal1 = document.getElementById("modal-background") ?? null;
    const openModalBtn1 = document.getElementById("openModalBtn") ?? null;
    const closeModalBtn1 = document.getElementById("closeModalBtn") ?? null;

    if (modal1 && openModalBtn1 && closeModalBtn1) {
        openModalBtn1.addEventListener('click', () => {
            modal1.classList.remove('hidden');
        });
        modal1.addEventListener('click', (event) => {
            if (event.target === modal1) {
                modal1.classList.add('hidden');
            }
        });
        closeModalBtn1.addEventListener('click', () => {
            modal1.classList.add('hidden');
        });
    }
</script>



<script>


    function openUpdateModal(id, carName, nameLocation, nombreJours, tauxJournalier) {
        const modalEdit = document.getElementById("modal-background");
        const locationIdInput = document.getElementById("locationId");
        const carNameInput = document.getElementById("carName");
        const nameLocationInput = document.getElementById("nameLocation");
        const nombreJoursInput = document.getElementById("nombreJours");
        const tauxJournalierInput = document.getElementById("tauxJournalier");

        // Pré-remplir les champs avec les données de la location
        locationIdInput.value = id;
        carNameInput.value = carName;
        nameLocationInput.value = nameLocation;
        nombreJoursInput.value = nombreJours;
        tauxJournalierInput.value = tauxJournalier;

        // Ouvrir le modal
        modalEdit.classList.remove('hidden');
    }
</script>

