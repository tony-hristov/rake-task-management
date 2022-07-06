require 'pastel'
require 'tty-progressbar'
require 'tty-prompt'

namespace :tty do
  desc 'TTY::Prompt examples'
  task :prompt, [:fi_name] do |_, args|

    def do_the_build(fi_name, is_prod, env_name)
      # ...
    end

    args.with_defaults(:fi_name => 'macu')

    prompt = TTY::Prompt.new
    pastel = Pastel.new
    bar = TTY::ProgressBar.new(pastel.italic.cyan.on_white("Building [:bar]"), total: 30)

    fi_name = prompt.ask('What is the FI name?') do |q|
      q.required true
      q.validate /[a-zA-Z]+/
      q.modify :capitalize
    end
    is_prod = prompt.yes?('Is it a production build?', default: false)
    env_name = prompt.select('What is the environment name?', %w[production staging neo trinity morpheus])

    print pastel.white.italic("Build for \"#{env_name}\" environment, FI: \"#{fi_name}\", is_prod: #{is_prod} ") + pastel.blue.on_white('...') + "\r"
    sleep(3)
    do_the_build(fi_name, is_prod, env_name)
    puts pastel.white("Build for \"#{env_name}\" environment, FI: \"#{fi_name}\", is_prod: #{is_prod} ") + pastel.green('DONE!')

  end
end
