require "bundler"
require "bundler/gem_tasks"

Bundler.setup
Bundler::GemHelper.install_tasks

require "rake"
require "rspec/core/rake_task"

desc "Run all examples"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.ruby_opts = %w[-w]
  t.pattern = Dir['spec/**/*_spec.rb'].reject { |f| f.match /spec\/dummy\/*/ }
end
