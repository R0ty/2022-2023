# sasso_carta_forbice

Il progetto è diviso principalemnte in due file:
- constant.dart
- main.dart

Nell constant.dart sono situate tutte le variabili che vengono utilizzate nel programma,come per esempio la lista di emoij e i risultati dei giocatori.

Nel main.dart invece c'è tutto l'eseguibile del programma. In questo ci sono diversi metodi utilizzati per:
- buildScelta() : usato per costruire la parte di pagina con le emoji scelte dal utente e dal pc
- bottoneScelta() : con cui costruisco i tre bottoni per scegliere il sasso la carta o la forbice. Dopo aver scielto il giocatore può scuotere il telefono e tramite degli if costrutiti nel setState() della funzione onPhoneShake all'utente verrà visulizzato il pop contente il risultato del match.