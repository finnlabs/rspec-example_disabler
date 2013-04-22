require 'rspec'

module RSpec::ExampleDisabler
  @@disabled_examples = {}

  def self.register_disabler
    RSpec.configure do |c|
      c.before(:each) do
        description = example.metadata[:full_description]
        if @@disabled_examples.include?(description)
          reasons = @@disabled_examples[description].join(', ')
          pending "Disabled by rspec-example_disabler. Reason: #{reasons}"
        end
      end
    end
  end

  def self.disable_example(example, reason)
    disable_examples([example], reason)
  end

  def self.disable_examples(examples, reason)
    examples.each do |example|
      if @@disabled_examples.include? example
        @@disabled_examples[example] << reason
      else
        @@disabled_examples[example] = [reason]
      end
    end
  end
end

RSpec::ExampleDisabler.register_disabler
