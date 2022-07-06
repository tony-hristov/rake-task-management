# Rake Task Management

Code and notes from studying Rake

To run the code:

```sh
bundle install
bundle binstubs rake
bin/rake                # runs the default task
bin/rake -T             # lists all the tasks
bin/rake custom_task    # example of a custom task
bin/rake db:seed        # example of a custom task with namespace and dependencies
bin/rake db:recreate    # example of multiple dependencies
# examples with arguments
bin/rake titles:set_title1 titles:set_title2 TITLE=Blog
bin/rake titles:set_title1 titles:set_title2 "titles:set_title3[Another blog post, Tony]" TITLE=Blog
bin/rake tty:prompt
```

## Setup

Following are notes on how to setup Rake (and Ruby or Ruby on Rails) project.

### Setup: VS Code

Install the following extensions to Visual Studio Code:

- [Ruby, Peng Lv](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby)

- [VSCode Ruby](https://marketplace.visualstudio.com/items?itemName=wingrunr21.vscode-ruby)

- [endwise](https://marketplace.visualstudio.com/items?itemName=kaiwood.endwise)

- [Rubocop for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=misogi.ruby-rubocop)

- [Ruby Solargraph](https://marketplace.visualstudio.com/items?itemName=castwide.solargraph)

- [vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)

- [Ruby on Rails, Hridoy](https://marketplace.visualstudio.com/items?itemName=hridoy.rails-snippets)

- [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)

### Setup: Global Gems

Install globally `rubocop` and `solargraph` gems:

```sh
rvm @global do gem install rubocop
rvm @global do gem install solargraph
```

### Setup: Project

Create `Gemfile` file in root of project:

```ruby
source 'https://rubygems.org'

group :development, :test do
  gem 'debase', '~> 0.2.5.beta2', require: false
  gem 'ruby-debug-ide', require: false
  gem 'solargraph', require: false
end

gem 'rake', '~> 13.0', '>= 13.0.6'
gem 'rspec-core', '~> 3.11', require: false
gem 'tty-prompt', '~> 0.23.1'
...
```

and run

```sh
bundle # same as `bundle install`
```

Create `.ruby-version` file in root of project, list the Ruby version:

```sh
3.1.2
```

Generate `binstubs` for the gems:

```sh
bundle binstubs bundler ruby-debug-ide solargraph
```

and also generate `binstubs` for test library (rspec for example), rake, etc:

```sh
bundle binstubs rspec-core rake
```

Verify the content of directory `bin/`.

## Links and References

- [Rake Task Management Essentials](https://www.packtpub.com/product/rake-task-management-essentials/9781783280773?_ga=2.32376122.506841903.1656868867-885678492.1656868867)

- [VS Code Setup for RoR](https://dev.to/abstractart/easy-way-to-setup-debugger-and-autocomplete-for-ruby-in-visual-studio-code-2gcc)

- [Ruby Style Guide](https://github.com/rubocop/ruby-style-guide)

- [Ruby Gems](https://rubygems.org/)

- [TTY Toolkit](https://ttytoolkit.org/)
