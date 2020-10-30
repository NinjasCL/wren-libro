.PHONY: build

b build:
	asciidoctor -a lang=es -b docbook book.adoc
	asciidoctor -a lang=es book.adoc
	mkdir -p dist
	mv book.html dist/index.html
	mv book.xml dist/book.xml
