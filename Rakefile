require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('ruby_textmate', '0.1.1') do |p|
  p.description = 'a ruby interface to textmate'
  p.url = 'http://github.com/ssoroka/ruby_textmate'
  p.author = 'Steven Soroka'
  p.email = 'ssoroka78@gmail.com'
  p.ignore_pattern = ["tmp/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each{|f| load f }