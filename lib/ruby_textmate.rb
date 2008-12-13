require 'tempfile'
class RubyTextmate
  class <<self
    def open(thing, options = {})
      if thing && thing !~ /[\s]/ && File.exist?(thing)
        open_file(thing, options)
      else
        open_text(thing, options)
      end
    end

    # acceptable options are:
    #  :async            Do not wait for file to be closed by TextMate.
    #  :wait             Wait for file to be closed by TextMate.
    #  :line => <number> Place caret on line <number> after loading file.
    #  :recent           Add file to Open Recent menu.
    #  :change_dir       Change TextMates working directory to that of the file.
    #  :no_reactivation  After edit :wait, do not re-activate the calling app.
    def open_file(filename, options = {})
      mate_options = []
      mate_options << '-w' if options[:wait]
      mate_options << '-a' if options[:async]
      mate_options << "-l #{options[:line]}" if options[:line]
      mate_options << '-r' if options[:recent]
      mate_options << '-d' if options[:change_dir]
      mate_options << '-n' if options[:no_reactivation]
      mate_options << filename
      system("mate", *mate_options)
    end

    def open_text(text, options = {})
      t = Tempfile.open('textmate')
      filename = t.path
      t.write(text)
      t.close
      open_file(filename, options)
      t.delete
      filename
    end
  end
end