# RSpec Example Disabler

Allows disabling specific examples. Useful when working with plugins that intentionally modify behavior of a core application. The disabled examples are marked as pending.

## Usage

In any plugin `*_spec.rb` file, you can disable another spec. Just make sure the spec file disabling the other spec is loaded when running the tests. You could also put the disabling
code into another file like a spec_helper.

    RSpec::ExampleDisabler.disable_example('<full description of example>', '<reason')

Example from [spec/example_disabler_spec.rb](spec/example_disabler_spec.rb):

    RSpec::ExampleDisabler.disable_example('RSpec::ExampleDisabler test example ' +
                                           'should be pending and thus not fail',
                                           'Testing rspec-example-disabler')

## License

(c) 2011 - 2013 - Finn GmbH

This gem is licensed under the GNU GPL v3.
