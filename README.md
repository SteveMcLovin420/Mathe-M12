# Mathematik: Präsentation und Hausarbeit zu zweit

Zwei unabhängig bearbeitbare LaTeX-Vorlagen mit dem **austauschbaren
Beispielthema quadratische Funktionen**. Beide verwenden deutsche Sprache,
Quellenfußnoten mit hochgestellten Fußmarken und ein automatisch erzeugtes
Literaturverzeichnis.
Kommentare mit `% BEARBEITEN`, `% QUELLEN` usw. erklären die Änderungen direkt
im Code. Ein Kommentar beginnt mit `%` und erscheint nicht im PDF.

## Schnellstart

1. In `Präsentation/main.tex` Titel, beide Namen, Einrichtung und Datum ändern.
2. In `Hausarbeit/main.tex` die Angaben bei `\newcommand` am Anfang ersetzen.
3. Beispielinhalte bearbeiten und eigene Quellen in der jeweiligen
   `literatur.bib` ergänzen. Nur tatsächlich geprüfte Literatur verwenden.
4. Im Repository-Hauptordner im Terminal ausführen:

```sh
make                 # Beide PDFs erstellen
make praesentation   # Nur die Präsentation
make hausarbeit      # Nur die Hausarbeit
```

Ergebnisse: `Präsentation/build/main.pdf` und `Hausarbeit/build/main.pdf`.
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

Das JLU-Logo liegt als `Hausarbeit/uni-logo.png` bei. Eine eigene Version kann
diese Datei ersetzen. Sie wird automatisch
mit erhaltenem Seitenverhältnis eingesetzt. Für PNG/JPG oder einen anderen Namen
`\logodatei` am Anfang von `Hausarbeit/main.tex` ändern. Ohne Bilddatei erscheint
ein deutlich markierter Platzhalter. Die Justus-Liebig-Universität Gießen ist bereits eingetragen. Die Hochschule wird bei `\einrichtung`
eingetragen; Personen, Kurs und Betreuung stehen direkt daneben im Quelltext.

## Präsentationsdesign: CAU

Die Präsentation verwendet das **CAU Beamer Theme** von Zhuo Yue mit grünem
Titelbereich, Abschnittsnavigation samt Folienpunkten und einer schmalen Fußzeile.
Die Folien bleiben im Format 16:9; deutsche Texte und Quellenfußnoten werden
weiter mit PDFLaTeX und BibTeX erstellt. Abschnittswechsel zeigen eine kurze
Übersicht zur Orientierung.

`Präsentation/CAU.sty` liegt lokal bei: Beim Hochladen nach Overleaf den ganzen
Präsentationsordner einschließlich dieser Datei übernehmen. Die Farbe wird mit
`\usepackage[color=CAU]{CAU}` gewählt; z. B. `CAU_SCI` ergibt eine blaue Variante.
Herkunft, Lizenz und Anpassungen stehen in `Präsentation/CAU-QUELLE.md`.

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
