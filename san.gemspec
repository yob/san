Gem::Specification.new do |s|
  s.name              = "san"
  s.version           = "1.0"
  s.summary           = "a (very) small library for working with Standard Address Numbers."
  s.description       = "a (very) small library for working with Standard Address Numbers."
  s.author            = "James Healy"
  s.email             = "jimmy@deefa.com"
  s.homepage          = "http://github.com/yob/san/tree/master"
  s.has_rdoc          = true
  s.rdoc_options     << "--title" << "SAN" << "--line-numbers"
  s.test_files        = FileList["spec/**/*_spec.rb"]
  s.files             = FileList[ "lib/**/*.rb", "MIT-LICENSE", "README.rdoc" ]
end
