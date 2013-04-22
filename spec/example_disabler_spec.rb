require 'rspec/example_disabler'

RSpec::ExampleDisabler.disable_example('RSpec::ExampleDisabler test example ' + 
                                       'should be pending and thus not fail',
                                       'Testing rspec-example-disabler')

describe RSpec::ExampleDisabler do
    describe 'test example' do
        it 'should be pending and thus not fail' do
            raise 'This test should be disabled, but is not.'
        end
    end
end
