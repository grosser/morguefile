name = "morguefile"
require "./lib/#{name.gsub("-","/")}/version"

Gem::Specification.new name, Morguefile::VERSION do |s|
  s.summary = "Morguefile.com api wrapper"
  s.authors = ["Michael Grosser"]
  s.email = "michael@grosser.it"
  s.homepage = "https://github.com/grosser/#{name}"
  s.files = `git ls-files lib/ bin/ MIT-LICENSE`.split("\n")
  s.license = "MIT"
  s.add_runtime_dependency "json"
end
