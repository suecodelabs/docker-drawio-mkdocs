# Static mkdocs generator (including drawio)

## What is it?

A script that will (re)build a local container to generate a static website for your [MkDocs](https://www.mkdocs.org) documentation, written in markdown and including generated [drawio](https://draw.io) images.

## How to use

Fork this repository, add your own content to the `docs` directory and generate the static content using `update.sh`.

Running `update.sh` will (re)build a local docker container and generate a `site`-directory with a static version of your `mkdocs` :)

Requires `docker` and `git` commands to be available.

## drawio?

[diagrams.net (drawio)](https://app.diagrams.net) is a neat solution to draw your images and save them to XML, SVG or binary formats (such as PNG).

Files generated using draw.io and saved as XML into `{filename}.drawio` will be converted into an `svg` file.

You can include files for generation in your markdown using `![example.drawio](example.drawio)`

## Markdown / MkDocs / MkDocs-Material

[MkDocs](https://www.mkdocs.org) will index, provide search functionality and format your [markdown](https://www.markdownguide.org) documents into a website. [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) is used to provide some extra bells and whistles

