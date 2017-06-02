module CarsHelper
  def car_options
    Car.all.pluck('mark')
  end

  def link_to_add_car(form, driver1)
    new_object = Car.new()
    creator = new_object.build_driver1
    fields = form.fields_for(:cars, new_object, 
      :child_index => 'new_car') do |fr|
      render('driver1s/one_car_form', fr: fr, i: 'Новый')
    end
    link_to(?#, class: 'btn btn-info', 
        id: 'add_car_link', data: {content: "#{fields}"}) do 
      fa_icon("plus") + " Новый автомобиль" 
    end
  end

  def link_to_remove_car(form)
    form.hidden_field(:_destroy, class: 'remove_fields') + 
        link_to(?#, class: 'remove_fields remove_car') do 
      fa_icon('times', title: 'Удалить автомобиль') + ' Удалить'      
    end
  end
end
