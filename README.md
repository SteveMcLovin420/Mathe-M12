# Mathematik: Hausarbeit und Präsentation mit LaTeX und Quarto

Vier unabhängig bearbeitbare Ordner:

| Dokument | LaTeX | Quarto |
| --- | --- | --- |
| Hausarbeit | `Hausarbeit (LaTeX)/main.tex` | `Hausarbeit (Quarto)/main.qmd` |
| Präsentation | `Präsentation (LaTeX)/main.tex` | `Präsentation (Quarto)/main.qmd` |

## Quarto auf dem Laptop ausprobieren

Im Terminal zuerst in den heruntergeladenen Projektordner wechseln.
Für die Präsentation:

```sh
cd "Präsentation (Quarto)"
quarto preview main.qmd
```

Für die Hausarbeit in einem neuen Terminal vom Projektordner aus:

```sh
cd "Hausarbeit (Quarto)"
quarto preview main.qmd
```

Die Vorschau öffnet sich im Browser und aktualisiert sich beim Speichern.
Das Terminal offen lassen; mit Strg+C beenden. Die Hausarbeit erscheint als
fortlaufende HTML-Seite, die Präsentation als Reveal.js-Folien.
Beide Beispiele benötigen weder Python noch R noch LaTeX für die HTML-Ausgabe.
Die Formeln verwenden die native MathML-Darstellung moderner Browser.
Die erzeugte HTML-Datei enthält Skripte und Styles und funktioniert offline.
Dafür einen aktuellen Browser verwenden und vor dem Vortrag testen.

Für die Hausarbeit erzeugt `quarto render main.qmd --to html` eine HTML-Datei.
Für die Präsentation `quarto render main.qmd` verwenden (Format Reveal.js).
Für eine Hausarbeit als PDF stattdessen im Hausarbeitsordner ausführen:

```sh
quarto install tinytex
quarto render main.qmd --to pdf
```

TinyTeX nur installieren, wenn noch keine geeignete LaTeX-Installation vorhanden
ist. Die PDF-Ausgabe verwendet hier das Standardlayout von Quarto; das gestaltete
Titelblatt der LaTeX-Vorlage ist darin noch nicht nachgebaut. HTML-Vorschau und
PDF haben unterschiedliche Seitenlayouts. Eine PDF kann ebenfalls im Browser
geöffnet werden, hat aber feste Druckseiten.

Installation prüfen: `quarto --version` und `quarto check`.
Ein Editor wie VS Code mit Quarto-Erweiterung ist praktisch, aber optional.

## Interaktive Quarto-Werkstatt

Die Quarto-Vorlagen greifen das Beispielthema und die Zitierwerkstatt der
LaTeX-Vorlagen auf. Die Präsentation enthält eine Unterrichtsstunde mit
Tafelphase, schrittweiser Ergebnissicherung, Partnerarbeit und Quellenfolien.
Die Hausarbeit ergänzt Definition, Satz, Beweis, nummerierte Gleichungen,
Abbildung, Tabelle und Querverweise.

In **beiden HTML-Dokumenten** direkt ausprobieren:

- Parabel-Labor: Regler für a, b und c, Graph, Scheitel, Diskriminante und
  Nullstellen; drei Voreinstellungen zeigen zwei, eine oder keine reelle
  Nullstelle. Bei a = 0 wird der lineare bzw. konstante Sonderfall erklärt.
- Quiz mit Rückmeldung und einem Hinweis nach einer falschen Antwort.
- Eingabefelder für die Nullstellen einer Partneraufgabe; Reihenfolge egal,
  Dezimalkomma und Dezimalpunkt möglich.
- Aufklappbare Musterlösungen und ein pausierbarer 5-Minuten-Timer.
- Quellenfußnoten mit einzelnen Seiten, Seitenbereichen, „vgl.“, mehreren
  Büchern und automatisch erzeugtem Literaturverzeichnis.

Quiz und Timer laufen pro Gerät im Browser. Es gibt keine gemeinsame
Online-Abstimmung, keine Antwortübertragung und keine dauerhafte Speicherung.
Ein Neuladen setzt die Übungen zurück. Der gestartete Timer läuft beim
Folienwechsel weiter; bei Bedarf vorher pausieren.

**Folien bedienen:** Pfeiltasten wechseln Folien, Esc öffnet die Übersicht,
F aktiviert Vollbild, S öffnet die Sprecheransicht (gegebenenfalls Pop-ups
zulassen). Innerhalb eines Reglers verändern Pfeiltasten dessen Wert.
Die Vorlagen verwenden einen festen Graphenausschnitt; Nullstellen außerhalb
des Ausschnitts stehen weiterhin im Ergebnistext.

**Was bearbeiten?** `main.qmd` enthält Texte, Formeln, Zitate, Folien und
Sprecherhinweise. `assets/demo.css` steuert das Browserdesign,
`assets/interaktiv.html` die Interaktionen. Die übrigen HTML-Bausteine im
assets-Ordner werden mit Quarto-Include-Kurzbefehlen eingebunden. Jeder
Dokumentordner enthält alle benötigten Dateien und lässt sich separat kopieren.
Anpassungen an gemeinsamen Bausteinen bei Bedarf in beiden Kopien vornehmen.

**Hausarbeit als PDF:** `quarto render main.qmd --to pdf` ersetzt den
interaktiven Abschnitt durch eine Papieraufgabe mit Musterlösung. Das PDF
verwendet Quarto-Standardlayout mit A4, 12 pt und 1,5-fachem Zeilenabstand.
Das JLU-Titelblatt der LaTeX-Version ist noch nicht nachgebaut. Das HTML nutzt
Autor-Jahr-Belege in expliziten Fußnoten; für Hochschulvorgaben kann später
eine passende CSL-Datei eingebunden werden.

**GitHub Desktop:** Nach Änderungen `Fetch origin` und gegebenenfalls
`Pull origin` wählen; erstmals das Repository klonen. Danach im lokalen
Projektordner die Vorschau starten. Ein Push aktualisiert die Quelldateien auf
GitHub und startet für Änderungen an der Quarto-Präsentation den Pages-Workflow.
Die erstmalige Pages-Aktivierung ist unten beschrieben.

## QR-Code und eigene Experimentierseite

`Präsentation (Quarto)` ist jetzt auch ein kleines Quarto-Website-Projekt:

| Datei | Zweck | Webadresse nach der Aktivierung |
| --- | --- | --- |
| `index.qmd` | Übersicht mit QR-Code und Links | `/Mathe-M12/` |
| `main.qmd` | Vortrag mit eigener QR-Folie | `/Mathe-M12/main.html` |
| `aufgaben.qmd` | Mobile Experimentierseite für die Zuhörer | `/Mathe-M12/aufgaben.html` |

Der QR-Code führt direkt zu
`https://stevemclovin420.github.io/Mathe-M12/aufgaben.html`.
Die PNG- und SVG-Dateien liegen unter `assets/mitmachen-qr.*` und können
auch in Arbeitsblättern oder anderen Präsentationen verwendet werden.
Eine Änderung der Zieladresse erfordert einen neuen QR-Code.

**Lokal öffnen:** Im Präsentationsordner `quarto preview` ausführen.
Quarto zeigt die lokale Adresse an; alternativ mit festem Port:

```sh
quarto preview --port 3000
```

Danach die angezeigte Adresse im Browser öffnen. `quarto preview main.qmd`
öffnet weiterhin gezielt den Vortrag. Der QR-Code enthält bewusst die feste
Online-Adresse; localhost auf dem Smartphone würde auf das Smartphone selbst
verweisen. Solange Pages nicht aktiviert ist, zum Testen die lokale Vorschau
auf dem Laptop verwenden.

### GitHub Pages

Die Website ist aktiviert; Build und Deployment waren am 16.10.2026 erfolgreich.

- Übersicht: <https://stevemclovin420.github.io/Mathe-M12/>
- Vortrag: <https://stevemclovin420.github.io/Mathe-M12/main.html>
- Experimentierseite / QR-Ziel: <https://stevemclovin420.github.io/Mathe-M12/aufgaben.html>

Das Repository ist öffentlich. Die folgenden Schritte dienen als Anleitung
für eine spätere Neueinrichtung:

1. Unter <https://github.com/SteveMcLovin420/Mathe-M12/settings/pages>
   im Bereich **Build and deployment → Source** die Option **GitHub Actions**
   auswählen. Das Repository muss dafür nicht öffentlich gemacht werden.
   GitHub Pages aus privaten Repositories benötigt einen dafür geeigneten
   Tarif, bei persönlichen Konten etwa GitHub Pro. Keine Tarif- oder
   Sichtbarkeitsänderung ist Teil dieser Einrichtung.
2. Unter **Actions → Quarto auf GitHub Pages** den Workflow starten
   (**Run workflow**) oder einen fehlgeschlagenen Lauf erneut ausführen.
3. Nach erfolgreichem Deploy die Online-Adresse öffnen und den QR-Code
   einmal auf einem Smartphone mit mobilen Daten testen.

Ab dann baut und veröffentlicht der Workflow bei Änderungen an
`Präsentation (Quarto)` auf `main` automatisch die drei Seiten. Zusätzlich
kann er jederzeit manuell gestartet werden. Der Workflow baut mit Quarto
1.8.27; auf dem Laptop ist keine zusätzliche Installation nötig.

**Umfang der Veröffentlichung:** Nur die im Präsentationsordner gerenderte
Website wird hochgeladen. Die Hausarbeiten und LaTeX-Vorlagen gehören nicht
zum Pages-Artefakt. Der Workflow verändert die Repository-Sichtbarkeit nicht.
Aktuell sind das Repository und die Pages-Webseite öffentlich zugänglich. Die Übungen
übertragen keine Antworten und benötigen keine Anmeldung.

## Ausführliche LaTeX-Vorlagen



Zwei unabhängig bearbeitbare LaTeX-Vorlagen mit dem **austauschbaren
Beispielthema quadratische Funktionen**. Beide verwenden deutsche Sprache,
Quellenfußnoten mit hochgestellten Fußmarken und ein automatisch erzeugtes
Literaturverzeichnis.
Kommentare mit `% BEARBEITEN`, `% QUELLEN` usw. erklären die Änderungen direkt
im Code. Ein Kommentar beginnt mit `%` und erscheint nicht im PDF.

## Schnellstart

1. In `Präsentation (LaTeX)/main.tex` Titel, beide Namen, Einrichtung und Datum ändern.
2. In `Hausarbeit (LaTeX)/main.tex` die Angaben bei `\newcommand` am Anfang ersetzen.
3. Beispielinhalte bearbeiten und eigene Quellen in der jeweiligen
   `literatur.bib` ergänzen. Nur tatsächlich geprüfte Literatur verwenden.
4. Im Repository-Hauptordner im Terminal ausführen:

```sh
make                 # Beide PDFs erstellen
make praesentation   # Nur die Präsentation
make hausarbeit      # Nur die Hausarbeit
```

Ergebnisse: `Präsentation (LaTeX)/build/main.pdf` und `Hausarbeit (LaTeX)/build/main.pdf`.
PDFs und Hilfsdateien im `build`-Ordner werden nicht in Git aufgenommen.
`make clean` entfernt die erzeugten Dateien. Zum Abgeben PDFs separat exportieren.

## Was ist enthalten?

| Präsentation (Beamer, 16:9) | Hausarbeit (A4) |
| --- | --- |
| Titelfolie mit zwei Namen, Gliederung | Gemeinsames Titelblatt, Kurzfassung, Inhaltsverzeichnis |
| Lernziele und 45-Minuten-Stundenplan | Einleitung, Fragestellung und didaktische Planung |
| Tafelauftrag, schrittweise Ergebnissicherung | Definition, Satz, Beweis, nummerierte Formeln |
| Funktionsgraph, Partneraufgabe, Musterlösung | Funktionsgraph, Tabelle, Querverweise, Fußnote |
| Sprecherhinweise, Quellenfolien | Zusammenarbeit, Fazit, Literaturverzeichnis, Anhang |

In der Tafelphase zunächst mit der Gruppe an der echten Tafel rechnen, dann die
Sicherungsfolie zeigen. `\pause` blendet Folieninhalte schrittweise ein. Für einen
Ausdruck zusätzlich die Klassenoption `handout` setzen (oben in `main.tex`).
Die `\note{...}`-Hinweise erscheinen standardmäßig nicht auf den Folien;
`\setbeameroption{show only notes}` erzeugt einen separaten Notizenausdruck.
Eine neue `frame`-Umgebung erzeugt eine neue Folie.

## Hausarbeit: Titelblatt und Logo

Die Hausarbeit hat ein gestaltetes Titelblatt mit Logo-Bereich, grünen Akzenten,
Metadatentabelle und dezenten laufenden Abschnittsüberschriften. Der Fließtext
bleibt in 12 pt mit eineinhalbfachem Zeilenabstand; Quellen stehen als Fußnoten.

Das JLU-Logo liegt als `Hausarbeit (LaTeX)/uni-logo.png` bei. Eine eigene Version kann
diese Datei ersetzen. Sie wird automatisch
mit erhaltenem Seitenverhältnis eingesetzt. Für PNG/JPG oder einen anderen Namen
`\logodatei` am Anfang von `Hausarbeit (LaTeX)/main.tex` ändern. Ohne Bilddatei erscheint
ein deutlich markierter Platzhalter. Die Justus-Liebig-Universität Gießen ist bereits eingetragen. Die Hochschule wird bei `\einrichtung`
eingetragen; Personen, Kurs und Betreuung stehen direkt daneben im Quelltext.

## Präsentationsdesign: CAU

Die Präsentation verwendet das **CAU Beamer Theme** von Zhuo Yue mit grünem
Titelbereich, Abschnittsnavigation samt Folienpunkten und einer schmalen Fußzeile.
Die Folien bleiben im Format 16:9; deutsche Texte und Quellenfußnoten werden
weiter mit PDFLaTeX und BibTeX erstellt. Abschnittswechsel zeigen eine kurze
Übersicht zur Orientierung.

`Präsentation (LaTeX)/CAU.sty` liegt lokal bei: Beim Hochladen nach Overleaf den ganzen
Präsentationsordner einschließlich dieser Datei übernehmen. Die Farbe wird mit
`\usepackage[color=CAU]{CAU}` gewählt; z. B. `CAU_SCI` ergibt eine blaue Variante.
Herkunft, Lizenz und Anpassungen stehen in `Präsentation (LaTeX)/CAU-QUELLE.md`.

## Quellen setzen – Schritt für Schritt

Jeder Ordner hat eine eigene `literatur.bib`, sodass sich jedes Dokument allein
weitergeben oder in Overleaf hochladen lässt. Gemeinsame Einträge in beiden
Dateien gleich halten. Die Vorlage nutzt **natbib + BibTeX**, nicht Biber.

1. In `literatur.bib` einen Eintrag anlegen. Kopiermuster für Buch, Artikel und
   Webseite stehen dort als Kommentare. Der Schlüssel (z. B. `polya1945`) ist
   frei wählbar, muss eindeutig sein und exakt zum Zitat passen.
2. In beiden Dokumenten denselben Befehl unmittelbar an der belegten Stelle
   setzen. Er erzeugt eine hochgestellte Fußmarke und den Kurzbeleg (Autor, Jahr,
   gegebenenfalls Seite) unten auf der Seite bzw. Folie:

```tex
Aussage\footcite{polya1945}.
Aussage\footcite[S.~23]{polya1945}.          % Mit Fundstelle
Aussage\footcite[vgl.][S.~23--25]{polya1945}. % Indirektes Zitat
Aussage\footcite{polya1945,spivak2008}.      % Mehrere Quellen, eine Fußnote
\enquote{Geprüfter Wortlaut}\footcite[S.~23]{polya1945}.
```

Die Seitenzahlen oben zeigen nur die Syntax; sie sind **keine geprüften
Fundstellen**. Direkte Zitate wortgetreu übernehmen, indirekte Aussagen mit
eigenen Worten formulieren und ebenfalls belegen. Quellen unmittelbar auf der
betreffenden Folie bzw. bei Abbildungen mit einer Fußmarke belegen. Ein Literaturverzeichnis allein
ersetzt keine Belege im Text. Webseiten benötigen eine konkrete URL und ein
Abrufdatum. Vorgaben eurer Einrichtung zum Zitierstil gehen vor; `plainnat`
formatiert hier die Kurzbelege und das Literaturverzeichnis.

Die Hausarbeit nummeriert Fußnoten fortlaufend (auch ergänzende Hinweise zählen
mit). Auch die Präsentation nummeriert fortlaufend; mit `\footnote[frame]` stehen die
Quellen auch bei Spalten unten auf der gesamten Folie. Das Literaturverzeichnis
enthält in beiden Dokumenten die vollständigen Angaben.
`\footcite` ist in beiden Vorlagen gleich definiert, nur die Platzierung der
Fußnote berücksichtigt die jeweilige Dokumentklasse.

Die `.bib`-Datei ist die Quellenbibliothek des jeweiligen Dokuments. Einen
Bibliothekseintrag allein anzulegen erzeugt noch keine Fußmarke: Dafür muss
`\footcite{schluessel}` an der gewünschten Textstelle stehen.

3. `make` erneut ausführen. `latexmk` startet automatisch PDFLaTeX, BibTeX und
   nötige Folgeläufe. Nur zitierte Quellen erscheinen in der Liste.
   `\nocite{schluessel}` nimmt gezielt eine weitere Quelle auf;
   `\nocite{*}` nimmt alle Einträge auf (für die Endfassung nur bewusst nutzen).
   Nicht die erzeugten `.bbl`-Dateien bearbeiten.

## Sichtbare Zitierdemonstration

Die Hausarbeit enthält eine eigene „Zitierwerkstatt“, die Präsentation vier
Demo-Folien. Sie zeigen einzelne Seiten, Seitenbereiche, „vgl.“, die Gestaltung
eines direkten Zitats, mehrere Quellen und Belege in Spalten. Alle dort
verwendeten Seitenzahlen sind **ungeprüfte Layoutbeispiele**; der Text in
Anführungszeichen ist erfundener Demotext. Vor Abgabe durch geprüfte Belege
ersetzen oder die Demonstration entfernen.

## Kleine LaTeX-Merkhilfe

| Zweck | Beispiel |
| --- | --- |
| Mathematik im Satz | `\(x^2+1\)` |
| Formel ohne Nummer | `\[x_{1,2}=\frac{-b\pm\sqrt{b^2-4ac}}{2a}\]` |
| Formel mit Nummer | `\begin{equation} ... \label{eq:name}\end{equation}` |
| Auf Formel verweisen | `\eqref{eq:name}` |
| Auf Abschnitt/Bild verweisen | `\ref{sec:name}` / `\ref{fig:name}` |
| Aufzählung | `\begin{itemize}\item Punkt\end{itemize}` |
| Abbildung einfügen | `\includegraphics[width=0.7\textwidth]{bild.pdf}` |
| Deutsches Zitat | `\enquote{Text}` |
| Sonderzeichen als Text | `\%`, `\&`, `\_`, `\#` |

Absätze durch eine Leerzeile trennen. `\\` ist in Tabellen und `align` ein
Zeilenwechsel; nicht als Ersatz für Absätze verwenden. Bilddateien neben der
jeweiligen `main.tex` ablegen. TikZ/PGFPlots erzeugt die Beispielgraphen direkt
aus einer Formel, sodass keine externen Bilddateien nötig sind.

## Gemeinsam arbeiten und abgeben

Beide Namen stehen auf den Titelblättern. Zuständigkeiten sind in der
Unterrichtsplanung und im Abschnitt „Zusammenarbeit“ vorbereitet. Rollen und
Zeitplan anpassen, die gesamte Arbeit gegenseitig lesen und Quellen gemeinsam
prüfen. Umfang, Layout und gegebenenfalls Eigenständigkeitserklärung nach den
Vorgaben eurer Lehrkraft ausrichten; eine optionale Erklärung ist im Code
vorbereitet. Beispieltexte und Platzhalter vor der Abgabe ersetzen.

## Umgebung und andere Rechner

Benötigt: TeX Live (oder MiKTeX), PDFLaTeX, BibTeX, `latexmk`; für die Kurzbefehle
auch `make`. Passende Debian/Ubuntu-Pakete:
`texlive-latex-base texlive-latex-recommended texlive-latex-extra texlive-pictures
texlive-fonts-recommended texlive-lang-german latexmk make`.

In dieser Cloud-Umgebung wurde das fehlende deutsche Sprachpaket außerhalb des
Repositories unter `/workspace/.texlive-german` ergänzt. `make` aktiviert es
automatisch samt lokalem PDFLaTeX-Format mit deutscher Silbentrennung.
Auf einem Rechner mit vollständiger LaTeX-Installation benötigt das Repository
keine solchen lokalen Pfade.

Ohne `make`: im gewünschten Dokumentordner ausführen (in dieser Cloud vorher die
lokalen TeX-Variablen aktivieren, siehe gespeicherte Startanleitung;
`make` erledigt dies automatisch):

```sh
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build main.tex
```

Overleaf: Dateien **eines** Dokumentordners als Projekt hochladen,
`main.tex` als Hauptdokument und pdfLaTeX als Compiler wählen.
Bei `?` statt Quellenangaben Schlüssel prüfen und neu bauen; bei
`File ... not found` das genannte Paket bzw. die Bilddatei ergänzen.
