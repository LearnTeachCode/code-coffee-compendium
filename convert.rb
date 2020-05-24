# Safe script for converting Asciidoc file to HTML
# Converts all .adoc files in the parent director to .html files
# Usage requires a sitemap.adoc file in the project's root directory

require 'asciidoctor'
require 'asciidoctor/cli/options'
require 'asciidoctor/cli/invoker'

require 'asciidoctor-diagram'

sitemappuml = File.open("sitemap.puml", "w")
sitemappuml.write "@startuml\nhide empty description\n"

Dir["./*.adoc"].each { |x|
  if not x.include? "sitemap"
    f = File.open(x, "r")
    
    filename = x.gsub(/.\//, "")
    filename = filename.gsub(/.adoc/, "")
    filename = filename.gsub(/-/, "")   

    f.each_line do |line|
      if line.start_with? "="
        if not line.include? "image"
          level = line.count("=")
          if level <= 2
            line = line.gsub(/\s+/, "")
            line = line.gsub(/=+/, "")
            line = line.gsub(/<</, "")
            line = line.gsub(/>>/, "")
            line = line.gsub(/\)/, "")       
            line = line.gsub(/\(/, "")
            line = line.gsub(/-/, "")
            line = line.gsub(/#/, "")
            line = line.gsub(/\,/, "")                 
            sitemappuml.write filename + " -down-> " + line + "\n"
          end      
        end      
      end    
    end  

    f.close  

    Asciidoctor.convert_file x, to_file: true, safe: :safe 
  end
}

sitemappuml.write "@enduml"
sitemappuml.close

Asciidoctor.convert_file "./sitemap.adoc", to_file: true, safe: :safe 

puts "Sitemap generated successfully."