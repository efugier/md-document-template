# sources:
# - https://jaantollander.com/post/scientific-writing-with-markdown
# - https://blog.kdheepak.com/writing-papers-with-markdown.html
BUILD_DIR=build
SOURCE_DIR=src
SRC = $(shell ls $(SOURCE_DIR)/*.md | sort)

OUTPUT_NAME=output

COMMON_ARGS = \
	--filter pandoc-citeproc \
	--from=markdown+tex_math_single_backslash+tex_math_dollars


pdf:
	mkdir $(BUILD_DIR) -p  # Creates the BUILD_DIR if it doesn't already exist.
	pandoc \
	$(SRC) \
	$(COMMON_ARGS) \
    	--to=latex \
    	--latex-engine=xelatex \
    	--output=$(BUILD_DIR)/$(OUTPUT_NAME).pdf


html:
	mkdir $(BUILD_DIR) -p  # Creates the BUILD_DIR if it doesn't already exist.
	pandoc \
	$(SRC) \
	$(COMMON_ARGS) \
	--to=html5 \
	--output=$(BUILD_DIR)/$(OUTPUT_NAME).html \
	--mathjax \
	--self-contained
