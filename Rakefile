require 'rake'
require 'rspec/core/rake_task'
require 'rdoc/task'
require 'san'

desc "Default: run specs"
task :default => :spec

desc "Run all specs"
RSpec::Core::RakeTask.new(:spec)

desc "Generate documentation"
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'SAN'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('MIT-LICENSE')
  rdoc.rdoc_files.include('CHANGELOG')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
