Gem::Specification.new do |s|
  s.name              = "san"
  s.version           = "1.3"
  s.summary           = "a (very) small library for working with Standard Address Numbers."
  s.description       = "a (very) small library for working with Standard Address Numbers."
  s.license           = "MIT"
  s.author            = "James Healy"
  s.email             = "jimmy@deefa.com"
  s.homepage          = "http://github.com/yob/san"
  s.has_rdoc          = true
  s.rdoc_options      << "--title" << "SAN" << "--line-numbers"
  s.test_files        = [ "spec/san_spec.rb" ]
  s.files             = [ "lib/san.rb", "MIT-LICENSE", "README.markdown", "CHANGELOG" ]

  spec.required_ruby_version = ">=1.9.3"

  s.add_dependency("ean13")
  s.add_development_dependency("rake")
  s.add_development_dependency("rspec", "~> 3.0")
end
