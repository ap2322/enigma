class Key

  def initialize
    @number = random_number
  end

  def random_number
    num_array = []
    5.times do
      num_array << rand(0..9)
    end
    num_array.join.to_s
  end
end
