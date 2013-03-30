require './critic'
require './chef'

class Review
  def self.find(id)
    review_data = RestRevDatabase.execute(<<-SQL, id)
      SELECT * 
      FROM reviews
      WHERE reviews.id = ?
    SQL
    review_data
  end
  
  def self.find_by_reviewer(reviewer_id)
    review_data = RestRevDatabase.execute(<<-SQL, reviewer_id)
      SELECT * 
      FROM reviews
      WHERE reviewer_id = ?
    SQL
    review data
  end
  
  def self.find_by_restaurant(rest_reviewed)
    review_data = RestRevDatabase.execute(<<-SQL, rest_reviewed)
      SELECT * 
      FROM reviews
      WHERE rest_reviewed = ?
    SQL
    review_data
  end
  
  def self.avg_score_by_critic(id)
    review_data = RestRevDatabase.execute(<<-SQL, id)
      SELECT AVG(score) 
      FROM reviews
      JOIN critic
      ON reviews.reviewer_id = critic.id
      WHERE critic.id = ?
      GROUP BY critic.id
    SQL
    review_data
  end
  
  def self.avg_score_by_restaurant(id)
    review_data = RestRevDatabase.execute(<<-SQL, id)
      SELECT AVG(score) 
      FROM reviews
      JOIN restaurant
      ON reviews.reviewer_id = restaurant.id
      WHERE restaurant.id = ?
      GROUP BY restaurant.id
    SQL
    review_data
  end
  
  def self.reviews_by_chef(id)
    review_data = RestRevDatabase.execute(<<-SQL, id)
      SELECT *
      FROM reviews
      JOIN restaurant
      ON reviews.rest_reviewed = restaurant.name
    SQL
    review_data
  end
  
  
  attr_reader :id
  attr_accessor :reviewer_id, :rest_reviewed, :review, :date, :score
  
  def initialize(options)
    @id, @reviewer_id, @rest_reviewed, @review, @date, @score =
      options.values_at("id", "reviewer_id", "rest_reviewed", "review", "date", "score")
  end
  
end