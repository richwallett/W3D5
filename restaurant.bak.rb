require './restaurants_database'
require './chef'

class Restaurant
  def self.find(id)
    rest_data = RestRevDatabase.execute(<<-SQL, id)
      SELECT * 
      FROM restaurant
      WHERE restaurant.id = ?
      SQL
      debugger
    Restaurant.new(rest_data[0]) 
    #rest_data.map { |rest_data| 
  end
  
  def self.find_by_neighborhood(neighborhood)
    rest_data = RestRevDatabase.execute(<<-SQL, id)
      SELECT * 
      FROM restaurant
      WHERE neighborhood = ?
    SQL
    rest_data
  end
  
  
  attr_accessor :name, :neighborhood, :cuisine
  attr_reader :id
  
  def initialize(options)
    @id, @name, @neighborhood, @cuisine = options.values_at("id", "name", "neighborhood", "cuisine")
  end
    
end

