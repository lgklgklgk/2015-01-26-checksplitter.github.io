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
  def initialize(outing)
    @outing = outing
    @checks = []
  end
  def split_check(m, g, t)
    split_check = Checksplitter.new(m, g, t)
  end
  def add_check(name, split_check)
    @checks.push(name: name, amount: split_check)
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

