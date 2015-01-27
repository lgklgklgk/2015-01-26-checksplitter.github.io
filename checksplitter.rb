class Checksplitter
  def initialize(param1, param2, param3)
    @meal = param1
    @group = param2
    @tip = param3
  end
end

def get_tip
  tip = (@meal * @tip) / 100
end
def split
  (@meal + ((@meal * @tip) / 100)) / @group
end
upstream = Checksplitter.new(174, 6, 20)
