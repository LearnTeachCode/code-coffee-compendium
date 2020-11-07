#!/bin/sh

docker run --rm --volume $PWD:/src -p 1313:1313 -w "/src" capsulecorplab/hugo-asciidoctor-plantuml:0.76.5-alpine 'hugo serve --bind=0.0.0.0 --buildDrafts --disableFastRender --destination public'
