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
binding.pry

