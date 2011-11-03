require 'action_view' unless defined?(ActionView)
class Rails
  def self.root
    File.join(File.dirname(__FILE__), '..')
  end
end unless defined?(Rails)