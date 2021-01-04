require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'github_changelog_generator/task'

GitHubChangelogGenerator::RakeTask.new :changelog do |config|
  config.user = 'smortex'
  config.project = 'skittlize'
  config.future_release = "v#{Skittlize::VERSION}"
end

task default: :spec
