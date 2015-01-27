require "pry"
class Checksplitter
  def initialize(meal, group, tip)
    @meal = meal
    @group = group
    @tip = tip
  end
  def meal
    @meal
  end
  def group
    @group
  end
  def tip
    @tip
  end
  def get_tip
    (meal * tip) / 100
  end
  def check_split
    (meal + ((meal * tip) / 100)) / group
  end
end

class Dinerclub
  def initialize(outing)
    @outing = outing
    @checks = []
    add_check(meal, group, tip)
  end
  def new_check(name, amount)
    add_check(meal, group, tip)
  end
  def add_check(meal, group, tip)
    @checks.push(Checksplitter.new(meal, group, tip))
  end
  def balance
    balance = 0.0
    @checks.each do |x|
      balance += x.check_split
    end
    return balance
  end
end
    
  
binding.pry

