require './review'

class Chef
  def self.find(id)
    rest_data = RestRevDatabase.execute(<<-SQL, id)
      SELECT * 
      FROM chef
      WHERE chef.id = ?
    SQL

    Chef.make_instances(rest_data)
  end
    
  def self.num_pro(id)
    rest_data = RestRevDatabase.execute(<<-SQL, id)
      SELECT COUNT(*) 
      FROM chef 
      WHERE mentorid = ?
      GROUP BY fname
    SQL

    Chef.make_instances(rest_data)
  end
  
  def self.list_pro(id)
    rest_data = RestRevDatabase.execute(<<-SQL, id)
      SELECT *
      FROM chef
      WHERE mentorid = ?
      GROUP BY fname
    SQL
    names = []

    Chef.make_instances(rest_data)
  end
  
  def self.find_coworkers(id)
    rest_data = RestRevDatabase.execute(<<-SQL, id)
      SELECT *
      FROM chef 
      JOIN tenure
      ON chef.id = tenure.chefid
      WHERE id > tenure.startdate AND id < tenure.enddate
    SQL

    make_instances(rest_data)
  end

     
  
  attr_accessor :fname, :lname, :mentorid
  attr_reader :id
  
  def initialize(options)
    @id, @fname, @lname, @mentorid = options.values_at("id", "fname", "lname", "mentorid")
  end
  
  def find_coworkers
    Chef.average_score_by_restaurant(id)
  end
  
  def reviews
    Review.reviews_by_chef(id)
  end


end


