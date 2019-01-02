require 'erb'

loader_template = ERB.new(File.read('loader.scd.erb'))
synths_template = ERB.new(File.read('synths.scd.erb'))
this_directory = (`pwd`).chomp

File.write("loader.scd", loader_template.result(binding))
File.write("synths.scd", synths_template.result(binding))