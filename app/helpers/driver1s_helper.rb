module Driver1sHelper
  def driver1_options
    Driver1.all.pluck('fn','sn','ln','birthday','inn','series_p','number_p','id')
  end
end
