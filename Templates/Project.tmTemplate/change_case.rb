#!/usr/bin/env ruby

# from abbot/lib/sproutcore/models/generator.rb
class Generator
  # Converts a string to snake case.  This method will accept any variation
  # of camel case or snake case and normalize it into a format that can be
  # converted back and forth to camel case.  
  #
  # === Examples
  # 
  #   snake_case("FooBar")           #=> "foo_bar"
  #   snake_case("HeadlineCNNNews")  #=> "headline_cnn_news"
  #   snake_case("CNN")              #=> "cnn"
  #   snake_case("innerHTML")        #=> "inner_html"
  #   snake_case("Foo_Bar")          #=> "foo_bar"
  #
  # === Params
  #
  #  str:: the string to snake case
  #

  def self.snake_case(str)
    str = str.gsub(/([^A-Z_])([A-Z][^A-Z]?)/,'\1_\2') # most cases
    str = str.gsub(/([^_])([A-Z][^A-Z])/,'\1_\2') # HeadlineCNNNews
    str.downcase
  end
  
  # Converts a string to CamelCase.  If you pass false for the second param
  # then the first letter will be lower case rather than upper.  This will
  # first snake_case the passed string.  This version differs from the 
  # standard camel_case provided by extlib by supporting a few standard
  # abbreviations that are always make upper case.
  #
  # === Examples
  #
  #  camel_case("foo_bar")                #=> "FooBar"
  #  camel_case("headline_cnn_news")      #=> "HeadlineCnnNews"
  #  camel_case("html_formatter")     #=> "HTMLFormatter"
  #  
  # === Params
  # 
  #  str:: the string to camel case
  #  capitalize:: capitalize first character if true (def: true)
  #
  ABBREVIATIONS = %w(html css xml)
  
  def self.camel_case(str, capitalize=true)
    str = self.snake_case(str) # normalize
    str.gsub(capitalize ? /(\A|_+)([^_]+)/ : /(_+)([^_]+)/) do 
      ABBREVIATIONS.include?($2) ? $2.upcase : $2.capitalize
    end
  end
end

if ARGV[0]=='snake'
  puts Generator.snake_case(ARGV[1])
elsif ARGV[0] == 'camel'
  puts Generator.camel_case(ARGV[1], true)
end
  
