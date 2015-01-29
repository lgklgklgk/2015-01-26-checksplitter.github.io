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
# @group : Integer, total size of the group
# @tip   : Integer, percent to tip
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

# Returns      : nil
# State Changes: nil
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
# Returns: nil
# 
#
# State Changes: nil
# 
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
# event_list   - hash containing restaurant and members who attended.
# members      - hash containing members of dinner club and amount spent.
# 
#
# public methods:
# initialize
# add_member
# show_members
# remove_member
# new_event
# show_events
# have_an_outing
# treat
class Dinerclub
# Public: Initialize
# Creates hashes for the dining club members and their specific outings.
#
# Parameters:
# members      - empty hash for club members and amount spent
# event_list   - empty hash for restaurant and attendees

# Returns      : nil
# State changes: creates empty hashes for instance variables. 
  def initialize
    @members = {}
    @event_list = Hash.new
  end 
# Public: add_member
# Adds a member to the @members hash and sets inital value to zero.
# Parameters:
# @members - Hash: a hash containing the dining club members and their values
#
# Returns      : @members hash
#
# State Changes: adds new member to @member hash
  
  def add_member(member)
    @members[member] = 0.0
    @members
  end
# Public: show_members
# Displays a list of the dining club members
#
# Parameters:
# @members - Hash: a hash containing the dining club members
#
# Returns      : @members hash
# State Changes: nil
  
  def show_members
    @members.each do |member, amt|
      puts member
    end
    @members
  end
# Public remove_member
# Removes a member from the @members hash
#
# Parameters:
# @members - Hash: a hash containing the dining club members and their values
#
# Returns       : @members hash
# State Changes : removes member from the @members hash
  def remove_member (member)
    @members.delete(member)
    @members
  end
# Public new_event
# adds a new restaurant and the diners that attended to the @event_list hash
#
# Parameters:
# @event_list - Hash: a hash containing the restaurants attended and the various
# diners who attended each restaurant
#
# Returns       : @event_list hash
# State Changes : adds new event to @event_list hash 
  def new_event(restaurant, *diners)
    @event_list[restaurant] = diners
    @event_list
  end
# Public show_events
# Displays the different restaurants and attendees
#
# Parameters:
# @event_list - Hash: a hash containing the restaurants and diners that attended them
#
# Returns     : @event_list hash
# Show Changes: nil
  
  def show_events
    @event_list.each do |restaurant, diners|
      print restaurant, diners
    end
    @event_list
  end
# Public have_an_outing
# Creates an outing where the check is split amongst the attending diners, and 
# subsequently added to the @members hash. If a diner is not already in the @members
# hash he or she will be automatically added.
#
# Parameters
# total    - Integer: The total amount of the bill
# tip      - Integer: The percentage to be tipped
# diners   - Array: Names of diners attending
# @members - Hash: a hash containing dining club members and the amount they've 
# spent
# Returns      : @members hash
# State Changes: Adds split check total to all members of the @members hash in 
# attendance. If they aren't in the hash they will be added.
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
# Public: treat
# Creates a different dining scenario where diners in attendance are recorded,
# but only one of the diners pays for the entire check.
#
# Parameters:
# meal    - Integer: Total price of the meal
# tip     - Integer: Percentage to be tipped
# treator - String : Name of diner covering the bill
# diners  - Array  : Other diners in attendance
# @members- Hash   : A hash containing all the dining club members and the amount
# they've spent.
# Returns      : @members hash
# State Changes: Will add total amount of bill to the treating diner's value in the
# @members hash. If the diner is not already a key in the hash, he or she will be 
# added.
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
club.new_event("Blue", "Kelly", "Anne", "Becky", "Luke")
club.have_an_outing(250, 25, "Kelly", "Anne", "Becky", "Luke")
club.new_event("Boiler Room", "Luke", "Becky")
club.treat(300, 20, "Luke", "Becky")


binding.pry

