require 'bundler/setup'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:rspec)

desc 'Run the test suite'
task default: :rspec

desc 'generate rdoc'
task :rdoc do
  sh 'yardoc'
end
