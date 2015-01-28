require "pry"
class Checksplitter
  attr_reader :meal, :group, :tip
  def initialize(meal, group, tip)
    @meal = meal
    @group = group
    @tip = tip
  end
  def get_tip
    (meal * tip) / 100
  end
  def check_split
    (meal + ((meal * tip) / 100)) / group
  end
end

class Dinerclub
  attr_reader :split
  def initialize(outing)
    @outing = outing
    @checks = []
  end
  def split_check(m, g, t)
    @split = Checksplitter.new(m, g, t).check_split
  
  end
end   
    
  
binding.pry

