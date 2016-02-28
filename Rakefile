require 'bundler/gem_tasks'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'

Cucumber::Rake::Task.new(:features)
RSpec::Core::RakeTask.new(:spec)

task :all_specs do
  Rake::Task[:features].invoke
  puts
  Rake::Task[:spec].invoke
end

task default: :all_specs
