require "rubygems"

def try_require(gem_name, lib_name = nil)
  gem gem_name
  require(lib_name || gem_name)

  yield if block_given?
rescue LoadError => e
  warn "#{__FILE__}: Could not load `#{gem_name}':\n#{e.class}: #{e.message}"
end

try_require 'interactive_editor'
try_require 'awesome_print', 'ap' do
  unless IRB.version.include?('DietRB')
    IRB::Irb.class_eval do
      def output_value
        ap @context.last_value
      end
    end
  else # MacRuby
    IRB.formatter = Class.new(IRB::Formatter) do
      def inspect_object(object)
        object.ai
      end
    end.new
  end
end
