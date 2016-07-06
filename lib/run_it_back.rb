require 'rspec/core/formatters/base_text_formatter'

class RunItBack < RSpec::Core::Formatters::BaseFormatter
  RSpec::Core::Formatters.register self, :dump_summary

  def dump_summary(summary)
    failed_files = summary.failed_examples.map { |e| RSpec::Core::Metadata::relative_path(e.file_path) }.uniq

    return if summary.failed_examples.empty?

    if summary.failed_examples.length.between?(2, 10)
      output.puts
      output.puts 'Rerun all failed examples:'
      output.puts
      output.puts failure_colored("rspec #{failed_example_output(summary.failed_examples)}")
    elsif failed_files.count <= 10
      output.puts
      output.puts 'Rerun all files containing failures:'
      output.puts

      output.puts failure_colored("rspec #{failed_files.join(' ')}")
    end
  end

  private

  def failed_example_output(failed_examples)
    line_number_hash = Hash.new { |h, k| h[k] = [] }
    failed_examples.each do |example|
      line_number_hash[example.metadata.fetch(:file_path)] << example.metadata.fetch(:line_number)
    end

    line_number_hash.map do |file_path, line_numbers|
      line_numbers = line_numbers.uniq
      if line_numbers.count > 1
        "#{file_path}:{#{line_numbers.join(',')}}"
      else
        "#{file_path}:#{line_numbers.first}"
      end
    end.join(' ')
  end

  def failure_colored(str)
    RSpec::Core::Formatters::ConsoleCodes.wrap(str, :failure)
  end
end
