require 'rake'
require 'spec/rake/spectask'

desc "Run all examples with RCov"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['rspec/**/*.rb']
  t.rcov = true
  t.rcov_opts = ['--exclude', 'rspec']
end
