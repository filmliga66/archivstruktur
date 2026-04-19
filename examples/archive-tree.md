# Beispielhafter Archivbaum

Fiktiver, aber vollständig regelkonformer Ausschnitt eines Archivs. Illustriert
alle fünf Hierarchie-Ebenen sowie typische Sonderfälle.

```text
archiv/
├── Digitalfoto/
│   ├── Ordnerstruktur/                       (reservierter, ignorierter Ordner)
│   │   └── archivstruktur.md
│   ├── 2019/
│   │   ├── F-Film-Liga/
│   │   │   └── F_2019-07-20_Sommerfest/
│   │   │       ├── F_2019-07-20_001.jpg
│   │   │       ├── F_2019-07-20_002.jpg
│   │   │       ├── F_2019-07-20_003.jpg
│   │   │       └── F_2019-07-20_003_bearbeitet.tif
│   │   └── M-Musikverein/
│   │       └── M_2019-05-00_Probenwoche/     (Tag 00 = ganzer Monat)
│   │           ├── M_2019-05-00_001.jpg
│   │           └── M_2019-05-00_002.jpg
│   └── 2026/
│       └── N-Narrenzunft/
│           └── N_2026-02-08_Narrentreffen/
│               ├── N_2026-02-08_001.jpg
│               └── N_2026-02-08_002.jpg
├── Ton/
│   └── 2012/
│       └── M-Musikverein/
│           └── M_2012-05-03_Fruehjahrskonzert/
│               ├── M_2012-05-03_001.wav
│               ├── M_2012-05-03_001_-6dB.wav
│               └── M_2012-05-03_001_-12dB.wav
└── Video/
    └── 2026/
        └── F-Film-Liga/
            └── F_2026-04-18_GV/
                ├── F_2026-04-18_001.mp4
                └── F_2026-04-18_002.mp4
```

## Erläuterungen

- `Ordnerstruktur/` auf Asset-Ebene ist für lokale Dokumentation reserviert und
  wird von Werkzeugen ignoriert.
- `M_2019-05-00_Probenwoche`: Tag `00` bedeutet, die Veranstaltung verteilt sich
  über den gesamten Mai. Dateien tragen ebenfalls Tag `00`.
- `F_2019-07-20_003.jpg` und `F_2019-07-20_003_bearbeitet.tif` demonstrieren
  Original und nachbearbeitete Fassung.
- `M_2012-05-03_001_-6dB.wav` zeigt dieselbe Tonaufnahme in gedämpfter
  Aufnahmeaussteuerung.
