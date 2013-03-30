require 'sqlite3'
require 'singleton'
require './restaurant.rb'
require './chef.rb'
require './critic.rb'
require './rest_model'

# check name
# check mentor
# check proteges
  # check num of proteges

class RestRevDatabase < SQLite3::Database
  include Singleton
  
  def initialize
    super("restrev.db")
    
    self.results_as_hash = true
    self.type_translation = true
  end
  
  def self.execute(*args)
    self.instance.execute(*args)
  end
end

rest = Restaurant.find(1)
p Restaurant.find_by_neighborhood("SOMA")