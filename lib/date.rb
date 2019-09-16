class Date

  def initialize
    @date = date
  end

  def date
    time = Time.new
    time.strftime("%m%d%y")
  end

end
