.PHONY: all run clean report

# R analysis script and outputs
SCRIPT       := Pokemon_Attack_Analysis.R
POP_IMG      := attack-population.png
SAMPLE_IMG   := attack-sample.png

# LaTeX report
TEX          := Pokemon_Attack_Report.tex
PDF          := Pokemon_Attack_Report.pdf

all: run report

run:
	Rscript $(SCRIPT)

report: run $(POP_IMG) $(SAMPLE_IMG) $(PDF)

$(PDF): $(TEX) $(POP_IMG) $(SAMPLE_IMG)
	pdflatex $(TEX) >/dev/null
	pdflatex $(TEX) >/dev/null  # twice for references

clean:
	rm -f $(POP_IMG) $(SAMPLE_IMG) *.aux *.log *.out $(PDF)
