#!/usr/bin/env ruby
require "erb"

## Fetch submodule
system "echo", "-n", "Initializing cookbook submodule ...    "
`git submodule update --init --recursive`
sleep(1)
system "echo", "-e", "\rInitializing cookbook submodule ...     [DONE]\033[K"

def random_string(length=10)
  chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  str = ''
  length.times { str << chars[rand(chars.size)] }
  str
end

class ERBContext
  def initialize(hash)
    hash.each_pair do |key, value|
      instance_variable_set('@' + key.to_s, value)
    end
  end

  def get_binding
    binding
  end
end

class String
  def eruby(assigns={})
    ERB.new(self).result(ERBContext.new(assigns).get_binding)
  end
end

## Create fresh .env with default database connection info
if !File.exists? "myapp/local-config.php"
    config_data = {
        :config => {
            "DB_NAME" => "myapp",
            "DB_USER" => "root",
            "DB_PASSWORD" => "password",
            "DB_HOST" => "127.0.0.1"
        }
    }
    system "echo", "-n", "Initializing local-config.php with defaults ..."
    template = File.read("myapp/local-config-sample.php")
    File.write("myapp/local-config.php", template.eruby(config_data))
    sleep(1)
    system "echo", "-e", "\rInitializing local-config.php with defaults ... [DONE]\033[K"
end

puts "Starting vm ..."
Dir.chdir("chef-myapp") do
    system "vagrant up"
end
