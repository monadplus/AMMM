.PHONY: all

TARGET=non-linear-programming

all: pdf

non-linear-programming.pdf: $(wildcard *.md)
	pandoc $(TARGET).md --pdf-engine=xelatex -o $(TARGET).pdf

pdf: non-linear-programming.pdf

clean:
	rm -f *.pdf
