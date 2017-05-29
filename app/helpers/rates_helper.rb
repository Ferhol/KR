module RatesHelper
  def rate_options
    Rate.all.pluck('name_r','times_of_day','range','price','id')
  end
end
