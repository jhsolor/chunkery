Gem::Specification.new do |s|
  s.name = 'chunkery'
  s.authors = ['Jonathan Solórzano-Hamilton']
  s.homepage = 'https://www.github.com/jhsolor/chunkery'
  s.version = '0.0.1'
  s.date = '2019-11-20'
  s.summary = %q(Rack middleware to clean up request chunking for malformed multipart form data)
  s.description = %q(Rack middleware to clean up request chunking for malformed multipart form data)
  s.files = [
    'lib/rack/chunkery.rb'
  ]
  s.require_paths = ['lib']

  s.add_dependency 'rack'
  s.add_development_dependency 'rack-test'
end
