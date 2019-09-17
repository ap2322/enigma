class Date

  def self.date
    time = Time.new
    time.strftime("%d%m%y")
  end

end
