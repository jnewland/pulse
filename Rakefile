begin
  require 'load_multi_rails_rake_tasks'
  require 'spec'
  require 'spec/rake/spectask'
rescue LoadError
  puts <<-EOS
To use rspec for testing you must install rspec, rspec-rails, and multi_rails gems:
  gem install rspec rspec-rails multi_rails
EOS
  exit(0)
end
 
desc "Run the specs under spec/models"
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', "spec/spec.opts"]
  t.spec_files = FileList['spec/*_spec.rb']
end
 
# Make spec the default task
# from http://blog.subterfusion.net/2008/rake-hacks-overriding-tasks-quick-binary-run-intelligent-irb/
Rake::TaskManager.class_eval do
  def remove_task(task_name)
    @tasks.delete(task_name.to_s)
  end
end
 
Rake.application.remove_task :default
task :default => :spec