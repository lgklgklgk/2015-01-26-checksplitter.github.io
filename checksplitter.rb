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
  def initialize(meal, tip, group)
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
  def get_tip
    (meal * tip) / 100
  end
  def get_total_bill
    ((meal * tip) / 100) + meal
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
# Public: Initialize
# Sets inital values for the members and the outing number
#
# Parameters:
# members      - sets starting keys and values for the dinner group
# outing       - sets integer value for a particular outing
# split        - instance variable linked to checksplitter object
# Returns      : Keys and values of the dinner club members
# State changes: Values of members hash can change based on other methods 
  def initialize
    @members = {}
    @event_list = Hash.new
  end 
  def add_member(member)
    @members[member] = 0.0
    @members
  end
  def show_members
    @members.each do |member, amt|
      puts member
    end
    @members
  end
  def remove_member (member)
    @members.delete(member)
    @members
  end
  def new_event(restaurant, *diners)
    @event_list[restaurant] = diners
    @event_list
  end
  def show_events
    @event_list.each do |restaurant, diners|
      print restaurant, diners
    end
    @event_list
  end
  def have_an_outing (total, tip, *diners)
    cs = Checksplitter.new(total, tip, diners.length)
    amount_per_person = cs.check_split
    diners.each do |diner|
      if @members.include?(diner)
        @members[diner] += amount_per_person
      else
        @members[diner] = amount_per_person
      end
    end
    @members
  end
  def treat(meal, tip, treator, *diners)
    cs = Checksplitter.new(meal, tip, diners)
    total_bill = cs.get_total_bill
    if @members.include?(treator)
      @members[treator] += total_bill
    else
      @members[treator] = total_bill
    end
    @members
  end  
end  
 
club = Dinerclub.new


binding.pry

