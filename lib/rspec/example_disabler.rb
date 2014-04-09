require 'rspec'

module RSpec::ExampleDisabler
  @@disabled_examples = {}

  def self.register_disabler
    RSpec.configure do |c|
      c.around(:each) do |example|
        description = example.metadata[:full_description]
        if @@disabled_examples.include?(description)
          reasons = @@disabled_examples[description].join(', ')
          example.metadata[:pending] = true
          example.metadata[:execution_result][:pending_message] = "Disabled by rspec-example_disabler. Reason: #{reasons}"
        else
          example.run
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
