require "rubygems"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new do |spec|
	spec.rspec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
end

desc "Run all specs in spec directory with RCov"
RSpec::Core::RakeTask.new(:rcov) do |spec|
	spec.rspec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
	spec.rcov = true
	spec.rcov_opts = lambda do
    IO.readlines(File.dirname(__FILE__) + "/spec/rcov.opts").map {|l| l.chomp.split " "}.flatten
  end
end

desc "Run the specs"
task :default => :spec

desc 'Removes trailing whitespace'
task :whitespace do
  sh %{find . -name '*.rb' -exec sed -i '' 's/ *$//g' {} \\;}
end
