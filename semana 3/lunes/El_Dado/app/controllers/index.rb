get '/' do
	@roll = Roll.create
  erb :index
end


# QUE HACER?: Convierte esta ruta para que utilice Ajax y si la petición no es de Ajax de igual forma sirva. 
post '/rolls' do
	# Si el user nos pasa un valor, lo usamos y so no creamos uno. 

  value = params[:value] ? params[:value].to_i : nil

  @roll = value ? Roll.create({ value: value }) : Roll.create

  erb :index  # TIP: Que esta haciendo esto y que debe hacer diferente. 

end
