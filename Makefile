.PHONY: all build post_build

all: build post_build

build:
	bazel build //:Skintracker

post_build:
	./post_build.sh

.PHONY: start

start:
	@cd bazel-bin && ./Skintracker
