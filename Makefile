PROJECT_ROOT := $(abspath .)
OUTPUT_NAME  := thesis
FONTS_PATH := $(abspath ./assets/fonts)

# Build the thesis PDF from the Typst template
default build:
	typst --font-path $(FONTS_PATH) --root=$(PROJECT_ROOT) compile ./template/thesis.typ $(OUTPUT_NAME).pdf

# Watch for changes to the Typst template and rebuild the thesis automatically
watch:
	typst --font-path $(FONTS_PATH) --root=$(PROJECT_ROOT) --watch ./template/thesis.typ $(OUTPUT_NAME).pdf

# Convert the thesis PDF to a JPG image (ImageMagick should be installed)
image: build 
	convert -density 500 $(OUTPUT_NAME).pdf $(OUTPUT_NAME).jpg

# Clean up the generated files
clean:
	rm *.pdf *.jpg
