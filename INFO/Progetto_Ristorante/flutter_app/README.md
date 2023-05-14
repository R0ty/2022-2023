# Documentazione
- main.dart : è il file alla base di tutta l'applicazione, oltre a questo contiene il bottone per inserire il tavolo del ordine
- routes.dart : contiene il NavigationDrawer che direziona lo spostamento delle pagine.

Nella cartella screens:
- pagina.dart : è una pagina dimanica basata su richieste al db locale che costruisce la pagina con il bottone per ogni piatto e le loro funzioni (click singolo e premuto).
- ordine.dart : è una pagina a se che continee la schermata del ordine finale dove si può modificare inviare o eliminare l'ordine

Nella cartella model:
- food.dart : contiene la classe per ottenere i dati dalla risposta json del DB
- constant.dart : in questo file sono contenute tutte le variabili locali del progetto: per esempio il numero del tavolo, la lista dei tavoli 

Nella cartella components: 
- botton.dart : contiene la costruzione dei bottoni principali utilizzati nel progetto: il bottome per i piatti (BottomAdd) e il bottone per modificare i paitti nella scheramta dell' ordine (BottomOrder).


Tutte le immagini e i loghi sono contenuti nella cartella assets


# COSE DA FARE

Da modificare lista dei tavoli senza farla alzare e scendere 
Da modificare tutte le misure per far si che le si utilizzano in base al telefono
Aggiungere la funzione di modifica sui bottoni del ordine 
Aggiungere la pagina per la registrazione
