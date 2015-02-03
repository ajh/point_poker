require 'factory_girl'
Pathname.glob Pathname.new(__dir__).join('../features/*.rb') { |f| require f }
World(FactoryGirl::Syntax::Methods)
