require "rspec/core/rake_task"
require_relative "bundler/audit/task"

RSpec::Core::RakeTask.new(:rspec)
task default: :rspec

Bundler::Audit::Task.new
task default: "bundle:audit"
