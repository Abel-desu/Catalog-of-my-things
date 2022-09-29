require './classes/app.rb'
puts 'Welcome to our Catalog'
def main
  app = Catalog.new
  app.act_regarding_input
end
main