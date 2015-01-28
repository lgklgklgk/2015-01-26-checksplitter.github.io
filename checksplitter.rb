require "pry"
# Class: Checksplitter
#
# Receives information (price of a meal, size of group, amount to tip) and
# splits the total amount among the group.
#
# Attributes:
# @meal   - Integer: Total cost of the meal 
# @group  - Integer: Total size of the group
# @tip    - Integer: Percent to tip
#
# Public Methods:
# #get_tip
# #check_split
class Checksplitter
# Public: Inititalize
# Sets initial values for Checksplitter object
#
# Params :
# @meal  : Integer, total price of meal
# @group : total size of the group
# @tip   : percent to tip
#
# Returns: nil
#
# State Changes:
# Sets the three primary attributes 
  attr_reader :meal, :group, :tip
  def initialize(meal, group, tip)
    @meal = meal
    @group = group
    @tip = tip
  end
# Public: #get_tip
# calculates amount of tip based on meal price and tip percentage.
# Parameters:
# meal - Integer: cost of the meal
# tip  - Integer: percent to tip
#
# Returns:
# Integer: Amount of the tip
# Sets amount of the tip
  def get_tip
    (meal * tip) / 100
  end
# Public: #check_split
# Splits the the total cost (meal + tip) amongst the group
#
# Parameters:
# meal  - Integer: cost of the meal
# tip   - Integer: amount of the tip
# group - Integer: size of the group
#
# Returns:
# Integer: Amount to be split amongst group
#
# State Changes:
# Sets amount to be split amongst group
  def check_split
    (meal + ((meal * tip) / 100)) / group
  end
end
# Class: Dinerclub
#
# Defines members of a dinner club and documents the money they spend
# at the meals they attend
#
# Attributes:
# split   - instance variable linked to previous checksplitter class
# members - hash containing members of dinner club and amount spent
# outing  - integer representing particular outing
#
# public methods:
# initialize
# split_check
# add_check
class Dinerclub
  attr_reader :split
  attr_accessor :members, :outing
# Public: Initialize
# Sets inital values for the members and the outing number
#
# Parameters:
# members      - sets starting keys and values for the dinner group
# outing       - sets integer value for a particular outing
# split        - instance variable linked to checksplitter object
# Returns      : Keys and values of the dinner club members
# State changes: Values of members hash can change based on other methods 
  def initialize(outing)
    @members = { "Jeff" => 0, "Kelly" => 0, "Becky" => 0, "Anne" => 0, "Josh" => 0 }
    @event_list = Hash.new
  end 
  def new_event(restaurant, *members)
    @event_list[restaurant] = *members
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
upstream.new_event("Blue", "Jeff", "Kelly", "Anne")
upstream.split_check(200, 3, 20)
upstream.split
upstream.add_check

binding.pry

