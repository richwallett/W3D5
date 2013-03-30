require './review'

class Critic
  def self.find(id)
    critic_data = RestRevDatabase.execute(<<-SQL, id)
      SELECT * 
      FROM critic
      WHERE critic.id = ?
      SQL
      
    Critic.new(critic_data[0])
  end
  
  attr_accessor :screenname
  attr_reader :id
  
  def initialize(options)
    @id, @screenname = options.values_at("id","screenname")
  end
  
  def find_reviews
    Review.find_by_reviewer(id)
  end
  
  def find_average_review_score
    Review.avg_score_by_critic(id)
  end
  
  def find_unreviewed
    Review.find_unreviewed(id)
  end
end


