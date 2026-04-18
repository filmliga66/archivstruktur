# Änderungshistorie

Alle bemerkenswerten Änderungen dieser Spezifikation werden hier dokumentiert.
Format angelehnt an [Keep a Changelog](https://keepachangelog.com/de/1.1.0/).

## [3.0] — 2026-04-18

### Hinzugefügt

- `README.md` mit Überblick über das Repository als Referenzspezifikation.
- Verzeichnis [reference/](reference/) mit maschinenlesbaren Tabellen
  (`clubs.csv`, `assets.csv`, `properties.csv`, `abbreviations.csv`) und
  `patterns.md` mit den regulären Ausdrücken pro Hierarchie-Ebene.
- Verzeichnis [examples/](examples/) mit Beispielbaum.
- Asset-Typ `Video` als zulässiger Ordner auf Ebene 1.
- Eigenschaft `bearbeitet` für nachbearbeitete Dateien.
- Reservierter Ordnername `Ordnerstruktur` auf Asset-Ebene (wird von
  Werkzeugen ignoriert).

### Geändert

- `archivstruktur.md` vollständig als sauberes Markdown neu geschrieben
  (vorher: HTML/CSS-Reste aus Word-Export).
- Asset-Ebene kanonisch auf `Digitalfoto`, `Ton`, `Video` festgelegt
  (abgestimmt mit der Referenzimplementierung ligarchivar).
- Formale Trennung von Pflichtsegmenten (Regex-validiert) und
  historisch-freien Eigenschaften.

### Entfernt

- Asset-Ordner `Dia` und `Negativ` auf Ebene 1. Materialien dieser Art
  werden digitalisiert unter `Digitalfoto` geführt.

## [2.3] — 2019-12-20

- Vereinsbuchstabe `R` für Fischerverein hinzugefügt.

## [2.2] — 2015-02-24

- Kapitel für Tiedmann-Bilder erstellt (Status: Entwurf).

## [2.1] — 2012-12-16

- Eigenschaften `LiedNN` und `AUTO` hinzugefügt.

## [2.0] — 2011-12-24

- Umbenennung des Dokuments in `Infos_zu_Archiv.doc`.
- Ton-Archivstruktur hinzugefügt.
- Dateinamen-Erweiterung „Eigenschaft“ hinzugefügt.

## [1.2] — 2011-12-10

- Abkürzung `LW` hinzugefügt.

## [1.1] — 2007-12-30

- Beginn der Versionshistorie.
