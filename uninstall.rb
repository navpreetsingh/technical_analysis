#!/usr/bin/env ruby

require 'rbconfig'
require 'fileutils'

if !defined? ::RbConfig
	dest = ::Config::CONFIG["sitelibdir"]
else
	dest = ::RbConfig::CONFIG["sitelibdir"]
end

src = File.join(File.dirname(__FILE__), "railsdemo", "vendor")

Dir.foreach(src) { |file|
	srcfile = File.join(src, file)
	if File.file?(srcfile)
		FileUtils.rm(File.join(dest, file), :force=>true, :verbose=>true)
	end
}

srcfonts = File.join(src, "fonts")
destfonts = File.join(dest, "fonts")

if FileTest.exist?(srcfonts)
	Dir.foreach(srcfonts) { |file|
		srcfile = File.join(srcfonts, file)
		if File.file?(srcfile)
			FileUtils.rm(File.join(destfonts, file), :force=>true, :verbose=>true)
		end
	}
	begin
		Dir.rmdir(File.join(destfonts))
	rescue
	end
end
