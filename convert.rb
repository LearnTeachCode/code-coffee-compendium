# Safe script for converting Asciidoc file to HTML

require 'asciidoctor'
require 'asciidoctor/cli/options'
require 'asciidoctor/cli/invoker'

require 'asciidoctor-diagram'

Asciidoctor.convert_file 'README.adoc', to_file: true, safe: :safe
