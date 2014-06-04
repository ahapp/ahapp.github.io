get '/' do
  # Look in app/views/index.erb
  @dbc = Location.all.map(&:city_name)

  # select and show by location!!
  @aha_heaven = {}
  first_5 = Aha.all.shift(5)

  first_5.each do |aha|
   @aha_heaven[aha[:title]] = aha[:body]
  end

  erb :index
end


get '/sf' do
  # Look in app/views/index.erb
  erb :location
end

post '/sf' do
  @aha_body = params[:aha_body]
  @aha_title = params[:aha_title]
  @aha_location = params[:location_id]


  Aha.create!(
    location_id: @location_id,
    title: @aha_title,
    body: @aha_body
    )

  @aha_heaven = {}
  Aha.all.each do |aha|
   @aha_heaven[aha[:title]] = aha[:body]
  end

  erb :location
end

get '/ny' do
  # Look in app/views/index.erb
  erb :location
end

get '/chi' do
  # Look in app/views/index.erb
  erb :location
end


# post '/sf' do
#   @aha = "/?sf=#{params[:user_aha]}"
#   @city = params[:user_city_name]

#   redirect to(@aha)
# end
