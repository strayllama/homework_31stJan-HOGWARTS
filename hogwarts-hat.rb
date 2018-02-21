require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/student.rb')

get '/hogwarts-students' do
  @students = Student.find_all()
  erb(:index)
end

get '/hogwarts-students/new' do
  erb(:new)
end

post '/hogwarts-students' do
  @student = Student.new(params)
  @student.save()
  erb(:confirm_added)
end
