require "pry"
class Checksplitter
  def initialize(param1, param2, param3)
    @meal = meal
    @group = group
    @tip = tip
  end
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
binding.pry

