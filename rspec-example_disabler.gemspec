Gem::Specification.new do |s|
    s.name       = 'rspec-example_disabler'
    s.version    = '0.0.1'
    s.date       = '2013-04-22'
    s.summary    = 'RSpec Example Disabler'
    s.description= 'Disable specific examples. Useful when working with ' +
                   'plugins that intentionally modify behavior'
    s.homepage   = 'https://github.com/finnlabs/rspec-example_disabler'
    s.authors    = ['Finn GmbH']
    s.email      = ['info@finn.de']
    s.files      = Dir['lib/**/*.rb'] + ['README.md']
    s.license    = 'GPLv3'
end
