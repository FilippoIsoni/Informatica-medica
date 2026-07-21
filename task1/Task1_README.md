# Task 1 – Analisi Rimborsi Ospedalieri per DRG

Compito di gruppo (Gruppo 13) sul calcolo dei rimborsi ospedalieri e di alcuni indicatori di controllo qualità a partire da un insieme di ricoveri, classificati per DRG (Diagnosis-Related Group).

## Quesito 1 — Calcolo dell'introito

Per ogni ricovero, dato il peso economico del suo DRG, la soglia nazionale di durata di degenza e la durata effettiva, viene applicata una tariffa:

- **T1** (tariffa giornaliera × 0.8) se la durata di degenza è di 1 giorno
- **T2** (peso × valore economico, 3000 €) se 1 < durata ≤ soglia
- **T2 + T3 × (durata − soglia)** se la durata supera la soglia, dove T3 è la tariffa giornaliera × 0.6

**Output:**
- Introito per ciascun DRG (`introiti_DRG`)
- Introito totale percepito dalla struttura ospedaliera: **€ 6.880.389,51**

## Quesito 2 — Indicatori di controllo

Per ciascun DRG:
- Proporzione dei ricoveri con durata di degenza significativamente inferiore allo standard nazionale (< 1/3 della durata standard)
- Proporzione dei ricoveri trasferiti verso un'altra struttura

Quattro DRG (37, 79, 105, 236) non presentano ricoveri registrati in questo dataset.

## File

```
├── Task1.m                                # script principale (parte 1 e parte 2)
├── ISONI_GRUPPO13_TASK1_QUESITO1.pdf       # risultati, Quesito 1
└── ISONI_GRUPPO13_TASK1_QUESITO2.pdf       # risultati, Quesito 2
```

## Requisiti

MATLAB, con `datiTask1.mat` (dati dei ricoveri: DRG, durata di degenza, flag di trasferimento e durate standard nazionali) nella working directory.
