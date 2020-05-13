# Safe script for converting Asciidoc file to HTML
# Converts all .adoc files in the parent director to .html files

require 'asciidoctor'
require 'asciidoctor/cli/options'
require 'asciidoctor/cli/invoker'

require 'asciidoctor-diagram'
 
Dir["./*.adoc"].each { |x| Asciidoctor.convert_file x, to_file: true, safe: :safe }
