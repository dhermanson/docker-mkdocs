mkfile_path = $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir = $(dir $(mkfile_path))
build_dir = $(mkfile_dir)build/
test_dir = $(build_dir)test

checkout_plantuml_markdown_repo:
	cd subrepos/plantuml-markdown && git checkout v1.2.0

echo_pwd:
	echo $(mkfile_dir)

image: checkout_plantuml_markdown_repo
	docker build -t dhermanson/mkdocs .

# test
test_init_docs: image
	docker run -it --rm -v $(test_dir):/app/data dhermanson/mkdocs mkdocs new data

test_serve_docs: test_init_docs
	docker run -it --rm -p 8000:8000 -v $(test_dir):/app/data --workdir /app/data dhermanson/mkdocs mkdocs serve --dev-addr 0.0.0.0:8000

run_bash_in_container: image
	docker run -it --rm -v $(test_dir):/app/data dhermanson/mkdocs sh
