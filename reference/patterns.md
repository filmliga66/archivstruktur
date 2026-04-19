# Reguläre Ausdrücke

Formale Validierungsregeln der Archivstruktur. Die Muster entsprechen exakt
denen der Referenzimplementierung
[ligarchivar](https://github.com/filmliga66/ligarchivar)
(`src/backend/FL.LigArchivar.Core/Utilities/Patterns.cs`).

## Bausteine

| Baustein     | Regex                       | Beschreibung                              |
| ------------ | --------------------------- | ----------------------------------------- |
| `ClubPart`   | `([A-Z])`                   | Vereinsbuchstabe, ein Großbuchstabe.      |
| `YearPart`   | `([12][0-9]{3})`            | Jahr, 1000–2999.                          |
| `MonthPart`  | `(0[0-9]\|1[0-2])`          | Monat, `00`–`12`.                         |
| `DayPart`    | `(0[0-9]\|[12][0-9]\|3[01])`| Tag, `00`–`31`.                           |
| `EventName`  | `([a-zA-Z0-9\-_]{1,200})`   | Eventname, 1–200 Zeichen.                 |
| `NumberPart` | `([0-9]{3})`                | Laufende Nummer, exakt drei Ziffern.      |
| `Property`   | `([a-zA-Z0-9\-_]{1,200})`   | Dateieigenschaft, 1–200 Zeichen.          |

## Zusammengesetzte Muster

### Event-Ordner

```regex
([A-Z])_([12][0-9]{3})-(0[0-9]|1[0-2])-(0[0-9]|[12][0-9]|3[01])_([a-zA-Z0-9\-_]{1,200})
```

Gruppen: `1` = Verein, `2` = Jahr, `3` = Monat, `4` = Tag, `5` = Eventname.

Beispiel: `F_2019-07-20_Sommerfest`

### Dateiname (ohne Endung)

```regex
([A-Z])_([12][0-9]{3})-(0[0-9]|1[0-2])-(0[0-9]|[12][0-9]|3[01])_([0-9]{3})(_([a-zA-Z0-9\-_]{1,200}))?
```

Gruppen: `1` = Verein, `2` = Jahr, `3` = Monat, `4` = Tag, `5` = Nummer,
`7` = Eigenschaft (optional).

Beispiele:

- `F_2019-07-20_001`
- `F_2019-07-20_042_bearbeitet`
- `M_2012-05-03_015_-6dB`

## Zusätzliche strukturelle Einschränkungen

Diese werden nicht durch die Regex allein geprüft, sondern durch die
Werkzeug-Logik:

- **Asset-Ordner** auf Ebene 1: Name muss in [assets.json](assets.json) stehen.
- **Jahr-Ordner** auf Ebene 2: 1700 ≤ Jahr ≤ 3000.
- **Vereins-Ordner** auf Ebene 3: Name muss exakt in [clubs.json](clubs.json) stehen.
- **Event-Ordner**: Vereinsbuchstabe und Jahr müssen zum Pfad passen (Eltern-
  Vereinsordner und Eltern-Jahr-Ordner).
- **Dateien**: Vereinsbuchstabe und Datum müssen mit dem Event-Ordner
  übereinstimmen.
