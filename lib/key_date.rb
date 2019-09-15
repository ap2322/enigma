class KeyDate

  def initialize
    @number = random_number
    @date = date
  end

  def random_number
    num_array = []
    5.times do
      num_array << rand(0..9)
    end
    num_array.join
  end

  def date
    time = Time.new
    time.strftime("%m%d%y")
  end

end
