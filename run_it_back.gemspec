Gem::Specification.new do |gem|
  gem.name        = 'run_it_back'
  gem.version     = '0.0.0'
  gem.date        = '2014-01-02'
  gem.summary     = "Outputs failing spec rerun command"
  gem.authors     = ["Nick Chmielewski"]
  gem.email       = 'hackling@gmail.com'
  gem.files       = ["lib/run_it_back.rb"]
  gem.homepage    = 'http://github.com/hackling/run_it_back'
  gem.license     = 'MIT'

  gem.add_dependency 'rspec', '~> 3.0'
end
