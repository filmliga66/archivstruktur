# archivstruktur

Kanonische Definition der Ordner- und Dateistruktur des digitalen Archivs der
Film-Liga 66 e.V.

Dieses Repository ist die **Referenzspezifikation**. Archivierungs-Werkzeuge
wie [ligarchivar](https://github.com/filmliga66/ligarchivar) implementieren
diese Spezifikation und validieren bestehende Archive gegen sie.

## Inhalt

| Pfad                                                         | Zweck                                          |
| ------------------------------------------------------------ | ---------------------------------------------- |
| [archivstruktur.md](archivstruktur.md)                       | Menschenlesbare Hauptspezifikation             |
| [CHANGELOG.md](CHANGELOG.md)                                 | Änderungshistorie der Spezifikation            |
| [reference/patterns.md](reference/patterns.md)               | Reguläre Ausdrücke pro Hierarchie-Ebene        |
| [reference/clubs.json](reference/clubs.json)                 | Vereine (maschinenlesbar)                      |
| [reference/assets.json](reference/assets.json)               | Asset-Typen (maschinenlesbar)                  |
| [reference/properties.json](reference/properties.json)       | Datei-Eigenschaften (maschinenlesbar)          |
| [reference/abbreviations.json](reference/abbreviations.json) | Abkürzungen (maschinenlesbar)                  |
| [examples/archive-tree.md](examples/archive-tree.md)         | Beispielhafter Archivbaum                      |

## Struktur auf einen Blick

```text
<root>/
└── <Asset>/             Digitalfoto | Ton | Video
    └── <Jahr>/          JJJJ (1700–3000)
        └── <Verein>/    z. B. F-Film-Liga
            └── <Event>/ F_JJJJ-MM-TT_Eventname
                └── F_JJJJ-MM-TT_NNN[_Eigenschaft].ext
```

Vollständige Regeln in [archivstruktur.md](archivstruktur.md).

## Für Werkzeug-Implementierer

Alle Validierungsregeln lassen sich aus den Regex-Mustern in
[reference/patterns.md](reference/patterns.md) und den JSON-Tabellen im
Verzeichnis [reference/](reference/) ableiten. Die JSON-Dateien sind
UTF-8-kodiert und enthalten auf oberster Ebene ein Array von Objekten.

Referenzimplementierung: [ligarchivar](https://github.com/filmliga66/ligarchivar)
(siehe `src/backend/FL.LigArchivar.Core/Data/` und
`src/backend/FL.LigArchivar.Core/Utilities/Patterns.cs`).

## Beitragen

Änderungen an der Spezifikation werden per Pull Request vorgeschlagen und
müssen einen Eintrag in [CHANGELOG.md](CHANGELOG.md) enthalten.

## Lizenz

Siehe [LICENSE](LICENSE).
