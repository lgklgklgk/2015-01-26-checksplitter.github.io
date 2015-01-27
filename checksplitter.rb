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
    add_check("Beginning Balance", 0)
  end
  def new_check(name, amount)
    add_check(var1, var2, var3)
  end
  def add_check(var1, var2, var3)
    @checks.push(Checksplitter.new(var1, var2, var3))
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

