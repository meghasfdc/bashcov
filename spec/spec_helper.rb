unless RUBY_ENGINE == 'rbx' # coverage support is broken on rbx
  require 'simplecov'
  SimpleCov.start do
    minimum_coverage 100
    add_group "Sources", "lib"
    add_group "Tests", "spec"
  end
end

require 'bashcov'

def test_app
  File.expand_path("../test_app", __FILE__)
end

def scripts
  "#{test_app}/scripts"
end

def test_suite
  "#{test_app}/test_suite.sh"
end

def executed_files
  Dir["#{scripts}/**/*"].select { |file| File.file? file }
end

