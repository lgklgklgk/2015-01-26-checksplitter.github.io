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
  attr_accessor :members, :outing
  def initialize(outing)
    @members = { "Jeff" => 0, "Kelly" => 0, "Becky" => 0, "Anne" => 0, "Josh" => 0 }
  end  
  def split_check(m, g, t)
    @split = Checksplitter.new(m, g, t).check_split
  end
  def add_check
    @members.each do |x, y|
      @members[x] = y + @split
    end
  end
end   
upstream = Dinerclub.new(1)
upstream.split_check(200, 3, 20)
upstream.split
upstream.add_check
binding.pry

