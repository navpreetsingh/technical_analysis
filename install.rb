#!/usr/bin/env ruby

require 'rbconfig'
require 'fileutils'

if !defined? ::RbConfig
	dest = ::Config::CONFIG["sitelibdir"]
else
	dest = ::RbConfig::CONFIG["sitelibdir"]
end

src = File.join(File.dirname(__FILE__), "vendor")

Dir.foreach(src) { |file|
	srcfile = File.join(src, file)
	if File.file?(srcfile)
		FileUtils.cp(srcfile, dest, :verbose=>true)
	end
}

srcfonts = File.join(src, "fonts")
destfonts = File.join(dest, "fonts")

if FileTest.exist?(srcfonts)
	if not FileTest.exist?(destfonts)
		Dir.mkdir(destfonts)
	end
	Dir.foreach(srcfonts) { |file|
		srcfile = File.join(srcfonts, file)
		if File.file?(srcfile)
			FileUtils.cp(srcfile, destfonts, :verbose=>true)
		end
	}
end
