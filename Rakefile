# frozen_string_literal: true

# Shell

irb = proc do |env|
  ENV['RACK_ENV'] = env
  trap('INT', 'IGNORE')
  dir, base = File.split(FileUtils::RUBY)
  cmd = if base.sub!(/\Aruby/, 'irb')
          File.join(dir, base)
        else
          "#{FileUtils::RUBY} -S irb"
        end
  sh "#{cmd} -r"
end

desc 'Open irb shell in test mode'
task :test_irb do
  irb.call('test')
end

desc 'Open irb shell in development mode'
task :dev_irb do
  irb.call('development')
end

desc 'Open irb shell in production mode'
task :prod_irb do
  irb.call('production')
end

# Specs

spec = proc do |type|
  desc "Run #{type} specs"
  task :"#{type}_spec" do
    sh "#{FileUtils::RUBY} -w spec/#{type}.rb"
  end

  desc "Run #{type} specs with coverage"
  task :"#{type}_spec_cov" do
    ENV['COVERAGE'] = type
    sh "#{FileUtils::RUBY} spec/#{type}.rb"
    ENV.delete('COVERAGE')
  end
end
spec.call('unit')
spec.call('web')

desc 'Run all specs'
task default: %i[web_spec unit_spec]

desc 'Run all specs with coverage'
task :spec_cov do
  ENV['RODA_RENDER_COMPILED_METHOD_SUPPORT'] = 'no'
  FileUtils.rm_r('coverage') if File.directory?('coverage')
  Dir.mkdir('coverage')
  Rake::Task['_spec_cov'].invoke
end
task _spec_cov: %i[web_spec_cov unit_spec_cov]
