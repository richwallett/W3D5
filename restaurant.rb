require './rest_model'

class Restaurant < RestModel
  def self.find(id)
    rest_data = RestRevDatabase.execute(<<-SQL, id)
      SELECT * 
      FROM restaurant
      WHERE restaurant.id = ?
      SQL
    
      Restaurant.new(rest_data[0])
    end
    
    def self.find_by_neighborhood(neighborhood)
      rest_data = RestRevDatabase.execute(<<-SQL, neighborhood)
        SELECT * 
        FROM restaurant
        WHERE neighborhood = ?
        SQL

      Restaurant.make_instances(rest_data)
    end
    
  
  attr_accessor :name, :cuisine, :neighborhood
  attr_reader :id
  
  def initialize(options)
    @id, @name, @cuisine, @neighborhood = options.values_at("id", "name", "cuisine", "neighborhood")
  end

  def find_reviews
    Review.find_by_restaurant(id)
  end
  
  def find_average_review_score
    Review.average_score_by_restaurant(id)
  end
  
end