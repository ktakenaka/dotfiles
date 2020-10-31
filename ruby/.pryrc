Pry.config.color = true
Pry.config.editor = ENV['EDITOR']

Pry.config.prompt = proc do |obj, _, _|
  prompt = ""
  prompt << "#{Rails.version}:#{Rails.env}@" if defined?(Rails) && Rails.respond_to?(:version)
  prompt << "#{RUBY_VERSION}"
  "#{prompt}(#{obj})> "
end

Pry.config.pager = false
Pry.config.ls.heading_color = :magenta
Pry.config.ls.public_method_color = :green
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :bright_black

begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError
  warn "failed to require awesome_print"
end
