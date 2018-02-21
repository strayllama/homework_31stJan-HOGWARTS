require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/student.rb')
require_relative('./models/house.rb')

# GETS
binding.pry

get '/hogwarts-students' do
  @students = Student.find_all()
  @houses = House.find_all()
  erb(:index)
end

get '/hogwarts-students/new' do
  @houses = House.find_all()
  erb(:new)
end


# POSTS

post '/hogwarts-students' do
  @student = Student.new(params)
  @student.save()
  erb(:confirm_added)
end
