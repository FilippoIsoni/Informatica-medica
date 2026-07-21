# Task 2 – Cifratura RSA di un messaggio

Compito di gruppo (Gruppo 13) sull'implementazione di una cifratura di tipo RSA su una riga di testo estratta da un file.

## Quesito 1 — Cifratura

Procedimento implementato:

1. Lettura della riga 13 del file `DRG.txt`
2. Conversione di ogni carattere in binario a 16 bit (codifica ASCII estesa) e concatenazione in un'unica stringa di bit
3. Suddivisione della stringa in blocchi da `k = 5` bit (con zero-padding finale se necessario) e conversione di ciascun blocco in decimale — questi valori decimali sono i "messaggi" `M` da cifrare
4. Cifratura di ogni blocco tramite esponenziazione modulare: `M_cript = M^e mod N`, con chiave pubblica `e = 13`, `N = 55`
5. Conversione di ogni valore cifrato in binario a 6 bit (sufficienti per rappresentare il resto massimo possibile, 54), concatenazione, e nuova suddivisione in blocchi da 16 bit per riconvertire in caratteri ASCII
6. Scrittura su file del messaggio cifrato (sia come testo che come stringa di bit)

**Output:** `ISONI_GRUPPO13_TASK2_QUESITO1.txt`, contenente il messaggio cifrato in forma testuale e la relativa stringa binaria.

## File

```
├── cifratura_RSA.m             # script di cifratura (Quesito 1)
└── QUESITO1.txt                # output: testo cifrato + stringa binaria
```

## Requisiti

MATLAB, con `DRG.txt` nella working directory.
