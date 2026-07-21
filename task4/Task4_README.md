# Task 4 – Query SQL e progettazione schema (database sanitario)

Compito di gruppo (Gruppo 13) su interrogazioni SQL e progettazione di uno schema relazionale per un contesto ospedaliero/sanitario.

## Quesito 1 — Interrogazioni SQL

Query su uno schema esistente con tabelle quali `persone`, `dipendenti`, `visite`, `ricoveri`, `interventi`, `prescrizioni`:

- **a.** Reparto dei dipendenti assunti nel 2002, ordinati per reparto decrescente
- **b.** Conteggio dei pazienti distinti con peso > 80 registrato in visita
- **c.** Pazienti (nome, cognome) con più di un ricovero, ordinati per cognome e nome decrescenti
- **d.** Medici con più di 10 interventi effettuati
- **e.** Somma dei costi delle prescrizioni associate alle visite del medico "Mario Rossi"

## Quesito 2 — Progettazione schema, DML e viste

- **a.** Creazione delle tabelle `immagini`, `server`, `visite`, con chiavi primarie ed esterne (`immagini.cod_server → server.cod`, `visite.url_immagine → immagini.url`)
- **b.** Inserimento (`INSERT`) di record di esempio in ciascuna tabella e relative istruzioni `DELETE`
- **c.** Vista `immagini_alta_risoluzione` per le immagini con risoluzione ≥ 1080×1920
- **d.** Conteggio delle visite per paziente
- **e.** Server il cui spazio occupato dalle immagini supera il 90% dello spazio di archiviazione totale

## File

```
├── QUESITO1.docx   # query sullo schema esistente
└── QUESITO2.docx   # creazione schema, DML, vista, query
```
