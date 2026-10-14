# Im Repository-Hauptordner ausführen. Für beide PDFs genügt: make
.PHONY: all praesentation hausarbeit clean

# Cloud: lokales deutsches Sprachpaket aktivieren, falls vorhanden.
# Bei vollständigem TeX Live/MiKTeX auf anderen Rechnern ohne Wirkung.
ifneq ($(wildcard /workspace/.texlive-german/usr/share/texlive/texmf-dist),)
export TEXMFHOME := /workspace/.texlive-german/usr/share/texlive/texmf-dist
export TEXMFVAR := /workspace/.texlive-var
export TEXMFCONFIG := /workspace/.texlive-config
endif

all: praesentation hausarbeit

praesentation:
	cd 'Präsentation' && latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error -outdir=build main.tex

hausarbeit:
	cd Hausarbeit && latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error -outdir=build main.tex

# Entfernt nur generierte Dateien in den beiden build-Ordnern.
clean:
	cd 'Präsentation' && latexmk -C -outdir=build main.tex
	cd Hausarbeit && latexmk -C -outdir=build main.tex
