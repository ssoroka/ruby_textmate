require "test/unit"

require "ruby_textmate"

class TestRubyTextmate < Test::Unit::TestCase
  def test_passing_textmate_a_file
    RubyTextmate.open_file(File.join(File.dirname(__FILE__), %w(.. README)), :wait => true)
  end
  
  def test_passing_textmate_some_text
    text = <<-TEXT
This is some
multi-line text that I expect
\ttextmate\nto handle.
TEXT
    RubyTextmate.open_text(text, :wait => true)
  end
  
  def test_open_url
    RubyTextmate.open_url('http://gist.github.com/raw/24825/64ab18a92caa7329a36cfbe68671a8cc10acc225', :wait => true)
  end
  
  def test_with_tempfile
    # wait is implied
    assert_equal RubyTextmate.with_tempfile("delete this line and save or the test will fail.\nbut leave this one"), 'but leave this one'
  end
end