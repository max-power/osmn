require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*_test.rb']
end

desc 'Run tests'
task default: :test

desc 'Open an irb session preloaded with this library'
task :console do
  exec 'irb -rubygems -I lib -r osmn'
end