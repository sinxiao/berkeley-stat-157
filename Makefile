all: html

build/%.md: %.md
	@mkdir -p $(@D)
	@cp $< $@

MARKDOWN = $(shell find . -not -path "./build/*" -name "*.md")
OBJ = $(patsubst %.md, build/%.md, $(MARKDOWN))

html: $(OBJ)
	make -C build html

clean:
	rm -rf $(OBJ) build/_build/
