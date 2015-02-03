# Require this file to be able to do capybara stuff in the rails console
#
# For example:
#
#   $ rails c
#   ruby > require Rails.root.join('lib/capybara_in_console')
#   ruby > App.show_game.load # starts firefox and tries to load the page
#

require 'capybara'
require 'capybara/dsl'

# use selenium so we can see the browser we're driving
Capybara.default_driver = :selenium

# This server needs to be running already
Capybara.app_host = 'http://localhost:3000'

require 'site_prism'
SitePrism.use_implicit_waits = true

# Autoload page objects. This allows `reload!` to work in the
# console.
ActiveSupport::Dependencies.autoload_paths << Rails.root.join('features/pages')
