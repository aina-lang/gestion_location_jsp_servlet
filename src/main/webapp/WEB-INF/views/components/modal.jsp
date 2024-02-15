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

<div id="modal-background1" style="background-color: rgba(39, 38, 38, 0.445);z-index:9999;"
    class="hidden flex fade-enter-active items-center justify-center w-full h-screen fixed top-0 left-0">
    <div id="modal" class="bg-white shadow-md rounded-lg p-5" style="width:60%;height: auto;">
        <div class="w-full text-right">
            <button id="closeModalBtn1"><i class="fa-solid fa-circle-xmark fa-beat"></i></button>
        </div>

        <form class="mt-4" method="POST" action="<%=application.getContextPath()%>/app">
        
            <label for="carName" class="block text-sm font-medium text-gray-700">Nom du voiture</label>
            <input type="text" id="carName" name="carName" class="mt-1 p-2 border rounded-md w-full" value="">

            <label for="nameLocation" class="block mt-4 text-sm font-medium text-gray-700">Nom de l'emplacement</label>
            <input type="text" id="nameLocation" name="nameLocation" class="mt-1 p-2 border rounded-md w-full" value="">

            <label for="nombreJours" class="block mt-4 text-sm font-medium text-gray-700">Nombre de jours</label>
            <input type="number" id="nombreJours" name="nombreJours" class="mt-1 p-2 border rounded-md w-full" value="">

            <label for="tauxJournalier" class="block mt-4 text-sm font-medium text-gray-700">Taux journalier</label>
            <input type="text" id="tauxJournalier" name="tauxJournalier" class="mt-1 p-2 border rounded-md w-full" value="">

            <div class="mt-4">
                <button type="submit" class="mt-1 p-2 bg-blue-500 rounded w-full text-white">Enregistrer</button>
            </div>
        </form>
    </div>
</div>

<script>
    const modal = document.getElementById("modal-background1") ?? null;
    const openModalBtn = document.getElementById("openModalBtn1") ?? null;
    const closeModalBtn = document.getElementById("closeModalBtn1") ?? null;

    if (modal && openModalBtn && closeModalBtn) {
        openModalBtn.addEventListener('click', () => {
            modal.classList.remove('hidden');
        });
        modal.addEventListener('click', (event) => {
            if (event.target === modal) {
                modal.classList.add('hidden');
            }
        });
        closeModalBtn.addEventListener('click', () => {
            modal.classList.add('hidden');
        });
    }
</script>
