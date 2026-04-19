# Archivstruktur der Film-Liga

Kanonische Spezifikation der Ordner- und Dateistruktur für das digitale Archiv
der Film-Liga 66 e.V. Diese Spezifikation ist die Referenzdefinition für
Archivierungs-Werkzeuge wie [ligarchivar](https://github.com/filmliga66/ligarchivar).

Ergänzende Materialien:

- [CHANGELOG.md](CHANGELOG.md) — Änderungshistorie dieser Spezifikation
- [reference/patterns.md](reference/patterns.md) — Reguläre Ausdrücke
- [reference/clubs.json](reference/clubs.json) — Vereine maschinenlesbar
- [reference/assets.json](reference/assets.json) — Asset-Typen maschinenlesbar
- [reference/properties.json](reference/properties.json) — Datei-Eigenschaften
- [reference/abbreviations.json](reference/abbreviations.json) — Abkürzungen
- [examples/archive-tree.md](examples/archive-tree.md) — Beispielbaum

---

## 1. Hierarchie

Das Archiv ist fünfstufig aufgebaut. Jede Ebene hat exakte Namensregeln.

```text
<Archivwurzel>/
└── <Asset>/                    Ebene 1 — Medientyp
    └── <Jahr>/                 Ebene 2 — Vierstelliges Jahr
        └── <Verein>/           Ebene 3 — Vereinsbuchstabe + Name
            └── <Event>/        Ebene 4 — Event-Ordner
                └── <Datei>     Ebene 5 — Mediendatei
```

## 2. Ebene 1 — Asset

Asset-Ordner auf oberster Ebene. Erlaubt sind genau folgende Namen:

| Name          | Inhalt                                  |
| ------------- | --------------------------------------- |
| `Digitalfoto` | Digitalfotos                            |
| `Dia`         | Dias (analog bzw. digitalisiert)        |
| `Negativ`     | Negative (analog bzw. digitalisiert)    |
| `Ton`         | Tonaufnahmen                            |
| `Video`       | Videoaufnahmen                          |

Der Name `Ordnerstruktur` ist für lokale Dokumentation reserviert und wird von
Werkzeugen ignoriert.

## 3. Ebene 2 — Jahr

Vierstelliges Jahr im Bereich `1700`–`3000`.

Beispiel: `2019`, `2026`.

## 4. Ebene 3 — Verein

Format: `{Buchstabe}-{Vereinsname}`

Der Buchstabe ist ein Großbuchstabe `[A-Z]`. Leerzeichen im Vereinsnamen werden
durch `_` ersetzt. Erlaubt sind ausschließlich die folgenden Ordner (siehe auch
[reference/clubs.json](reference/clubs.json)):

| Ordnername                    | Bedeutung                         |
| ----------------------------- | --------------------------------- |
| `A-Albverein`                 | Albverein                         |
| `C-Gemischter_Chor`           | Gemischter Chor                   |
| `D-Dorffest`                  | Dorffest, Dorfgemeinschaft        |
| `F-Film-Liga`                 | Film-Liga                         |
| `G-Gemeinde`                  | Gemeinde                          |
| `H-Hochzeiten`                | Hochzeiten                        |
| `K-Kirche`                    | Kirche                            |
| `L-Ledige`                    | Ledige                            |
| `M-Musikverein`               | Musikverein                       |
| `N-Narrenzunft`               | Narrenzunft                       |
| `P-Personen_und_Begebenheiten`| Personen und Begebenheiten        |
| `R-Fischerverein`             | Fischerverein                     |
| `S-Schuetzenverein`           | Schützenverein                    |
| `T-TSV`                       | TSV, Skiclub                      |
| `V-Ansichten`                 | Ansichten, RumVi                  |
| `W-Feuerwehr`                 | Feuerwehr                         |
| `Z-Kegler`                    | Kegler                            |

## 5. Ebene 4 — Event

Format: `{Buchstabe}_{JJJJ}-{MM}-{TT}_{Eventname}`

| Segment       | Regel                                                |
| ------------- | ---------------------------------------------------- |
| `Buchstabe`   | Vereinsbuchstabe, `[A-Z]`. Muss zum Elternordner passen. |
| `JJJJ`        | Jahr, `[12][0-9]{3}`. Muss zum Elternordner passen.  |
| `MM`          | Monat `00`–`12`. `00` = ganzes Jahr.                 |
| `TT`          | Tag `00`–`31`. `00` = ganzer Monat.                  |
| `Eventname`   | `[a-zA-Z0-9\-_]`, 1–200 Zeichen.                     |

Beispiel: `F_2019-07-20_Sommerfest`

## 6. Ebene 5 — Datei

Format: `{Buchstabe}_{JJJJ}-{MM}-{TT}_{NNN}[_{Eigenschaft}].{ext}`

| Segment        | Regel                                                      |
| -------------- | ---------------------------------------------------------- |
| `Buchstabe`    | Vereinsbuchstabe, identisch mit Event-Ordner.              |
| `JJJJ-MM-TT`   | Datum identisch mit Event-Ordner.                          |
| `NNN`          | Laufende Nummer, genau drei Ziffern.                       |
| `Eigenschaft`  | Optional. Siehe [Abschnitt 7](#7-eigenschaften).           |
| `ext`          | Dateiendung entsprechend Format (z. B. `jpg`, `wav`, `mp4`). |

Mehrere Dateien mit identischem Basisnamen (gleicher Nummer) sind erlaubt,
sofern sich die Dateiendung unterscheidet. Beispiel: `F_2019-07-20_001.jpg`
und `F_2019-07-20_001.xmp`.

Beispiele:

- `F_2019-07-20_001.jpg`
- `F_2019-07-20_042_bearbeitet.tif`
- `M_2012-05-03_015_-6dB.wav`

## 7. Eigenschaften

Die Eigenschaft ist optional und wird mit `_` an die laufende Nummer angehängt.
Mehrere Eigenschaften werden ohne Trennzeichen aneinander gereiht.

Von Werkzeugen wie ligarchivar erkannte Eigenschaften
(siehe [reference/properties.json](reference/properties.json)):

| Eigenschaft   | Bedeutung                                             |
| ------------- | ----------------------------------------------------- |
| `-6dB`        | Dieselbe Tonaufnahme, 6 dB leiser aufgenommen.        |
| `-12dB`       | Dieselbe Tonaufnahme, 12 dB leiser aufgenommen.       |
| `bearbeitet`  | Nachbearbeitete Version einer Originaldatei.          |

Weitere, historisch verwendete Eigenschaften (nicht von Werkzeugen interpretiert,
aber durch den Regex erlaubt):

- `DAT` — von DAT-Kassette
- `Tonband` — von Tonband
- `MC` — von Musikkassette
- `LINE` — zweiter Eingang am Aufnahmegerät (weiterer Kanal)
- `LiedNN` — Lied Nummer NN aus der Gesamtaufnahme extrahiert
- `AUTO` — automatisch ausgesteuert

## 8. Zusätzliche Regeln

- **Maximale Länge** von Ordner- und Dateinamen: 50 Zeichen.
- **Tag `00`** bedeutet: Ereignis verteilt über den ganzen Monat (oder mehrere
  Folgemonate). Die Dateien im Verzeichnis tragen ebenfalls Tag `00`, damit
  keine Dateinamen-Kollisionen entstehen.
- **Textdateien** mit Erklärungen und Zusatzinformationen tragen den Namen
  ihres Ordners.
- **Ereignis über 24 Uhr hinaus**: Datum des vorigen Tages verwenden. Ausnahme:
  mehrtägige Veranstaltungen.

## 9. Bewertung in Adobe Bridge

Bildbewertung für `Digitalfoto`:

| Sterne | Bedeutung                           |
| ------ | ----------------------------------- |
| 1      | Sehr schlechtes Bild, gerade noch im Archiv |
| 2      | Schlechtes Bild                     |
| 3      | Bild ist in Ordnung                 |
| 4      | Gutes Bild                          |
| 5      | Besonderes Bild                     |

## 10. Abkürzungen

Abkürzungen sind Konstanten und werden großgeschrieben. Siehe auch
[reference/abbreviations.json](reference/abbreviations.json).

| Abkürzung | Bedeutung                                                     |
| --------- | ------------------------------------------------------------- |
| `NNJ`     | NN Jahre (z. B. `60J`)                                        |
| `FL`      | Film-Liga                                                     |
| `GC`      | Gemischter Chor                                               |
| `GS`      | Grundschule                                                   |
| `PGR`     | Pfarrgemeinderat                                              |
| `GEB`     | Geburtstag                                                    |
| `GV`      | Generalversammlung                                            |
| `SSE`     | Seelsorgeeinheit                                              |
| `KIFE`    | Kinderferienprogramm                                          |
| `KLJB`    | Katholischer Landjugendbund                                   |
| `NT`      | Narrentreffen                                                 |
| `ORAT`    | Ortschaftsrat                                                 |
| `BMG`     | Bürgermeister Gombold                                         |
| `JUGU`    | Jugend-Gruppe                                                 |
| `LW`      | Landwirtschaft (innerhalb Personen und Begebenheiten)         |
| `WUERT`   | Württemberg, württembergisch                                  |

## 11. Tiedmann-Negative

Historische Negativsammlung Tiedmann, separat geführt.

### 11.1 Negativnummer

Format: `{Ordner}-{Blatt}-{Streifen}-{Nummer}`

| Segment   | Regel                                                       |
| --------- | ----------------------------------------------------------- |
| `Ordner`  | Römisch nummeriert, z. B. `X`, `XVIII`.                     |
| `Blatt`   | Zweistellig, z. B. `12`.                                    |
| `Streifen`| Einstellig, `1`–`7`.                                        |
| `Nummer`  | Bildnummer auf dem Streifen, z. B. `2`, `15a`, `23`.        |

### 11.2 Dateiname

Format: `{Kategorie}_{Sortierung}_{Negativnummer}_{Auflösung}`

| Segment         | Regel                                                    |
| --------------- | -------------------------------------------------------- |
| `Kategorie`     | Vereinsbuchstabe analog zu Abschnitt 4 (in Definition).  |
| `Sortierung`    | Vierstellige Nummer für grobe zeitliche Sortierung.      |
| `Negativnummer` | Siehe 11.1.                                              |
| `Auflösung`     | Scanauflösung, z. B. `Vorschau`, `Hoch`, `Nachbearbeitet` (in Definition). |
