# Task 3 – Compressione di immagine tipo JPEG (DCT)

Compito di gruppo (Gruppo 13) sull'implementazione di una compressione a blocchi basata su DCT (Discrete Cosine Transform), analoga allo schema usato in JPEG, applicata a un'immagine ecografica (`13_ECO_Mammaria.jpg`).

## Quesito 1 — Compressione

Procedimento implementato:

1. Caricamento dell'immagine e della matrice di quantizzazione `Q` (`matriceQ.mat`)
2. Suddivisione dell'immagine in blocchi 8×8, con zero-padding se le dimensioni non sono multiple di 8
3. Per ogni blocco:
   - Trasformata coseno discreta 2D (`dct2`)
   - Quantizzazione dei coefficienti dividendo per `Q * alpha` (fattore di compressione `alpha = 10`) e arrotondando
   - Riordino dei coefficienti quantizzati in un vettore tramite scansione a zig-zag, separando componente DC (continua) e componenti AC
4. Codifica differenziale della componente DC tra blocchi consecutivi (si codifica la differenza rispetto al DC del blocco precedente, non il valore assoluto)
5. Codifica della componente AC troncando gli zeri finali di ciascun blocco (run-length implicito: si mantiene solo fino all'ultimo coefficiente non nullo)
6. Scrittura su file di ogni blocco nel formato `<DC><AC1 AC2 ...>`

**Output:** `ISONI_GRUPPO13_TASK3_QUESITO1.txt`, un blocco per riga con DC differenziale e coefficienti AC troncati.

## File

```
├── compressione_jpg.m                     # script di compressione (Quesito 1)
├── QUESITO1.txt                           # output: blocchi <DC><AC>
├── matriceQ.mat                           # matrice di quantizzazione 8x8
└── 13_ECO_Mammaria.jpg                    # immagine di input (ecografia)
```

## Requisiti

MATLAB con Image Processing Toolbox (per `dct2`), e una funzione `zigzag` (non inclusa nello script, va definita o reperita a parte) per la scansione a zig-zag dei blocchi 8×8.
