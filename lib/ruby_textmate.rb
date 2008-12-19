require 'tempfile'
require 'net/http'
require 'net/https'
require 'net/ftp'
require 'open-uri'
require 'open3'

class RubyTextmate
  class <<self
    def open(thing, options = {})
      if thing
        if thing =~ /^http\:\/\//i
          open_url(thing, options)
        elsif thing !~ /[\s]/ && File.exist?(thing)
          open_file(thing, options)
        else
          open_text(thing, options)
        end
      end
    end

    def open_file(filename, options = {})
      mate_options = build_mate_options(options)
      mate_options << filename
      system("mate", *mate_options)
    end

    def with_tempfile(init_text, options = {})
      t = Tempfile.open('textmate')
      filename = t.path
      t.write(init_text)
      t.close
      open_file(filename, options.merge(:wait => true))
      t.open
      result = t.read
      t.close
      t.delete
      result
    end
    
    def open_text(text, options = {})
      Open3.popen3("mate #{build_mate_options(options).join(' ')}") do |stdin, stdout, stderr|
        stdin.write(text)
        stdin.close_write
        stdout.read if options[:wait]
      end
    end
    
    def open_url(url, options = {})
      Kernel.open(url) do |f|
        open_text(f.read, options)
      end
    end

    private
      def build_mate_options(options)
        mate_options = []
        mate_options << '-w' if options[:wait]
        mate_options << '-a' if options[:async]
        mate_options << "-l #{options[:line]}" if options[:line]
        mate_options << '-r' if options[:recent]
        mate_options << '-d' if options[:change_dir]
        mate_options << '-n' if options[:no_reactivation]
        mate_options
      end
  end
end