# Myriad Mkdocs Dockerfile
This repository contains the source code for a dockerfile which bundles up tools to facilitate writing documentation.

## Download

```sh
git clone --recursive <path-to-this-repo>
```

## Create Image
```sh
make image
```

## Use in a project

### Initialize docs root
```sh
docker run -it --rm -v $(pwd):/app myriadmobile/mkdocs:latest new docs
```

### Serve docs
```sh
docker run -it --rm -p 8000:8000 -v $(pwd):/app --workdir /app/docs myriadmobile/mkdocs:latest serve --dev-addr 0.0.0.0:8000
```

### Add extensions support
If you want to include inline plantuml support via [plantuml-markdown]( https://github.com/mikitex70/plantuml-markdown ), then you must add the `plantuml` entry to the `markdown_extensions` sections of your project's `mkdocs.yml` file similar to:

```yaml
site_name: My Docs
markdown_extensions:
  - plantuml
  - markdown_include.include
```

#### Available Extensions
- [plantuml-markdown]( https://github.com/mikitex70/plantuml-markdown )
- [ markdown_include.include ](https://github.com/cmacmackin/markdown-include)
