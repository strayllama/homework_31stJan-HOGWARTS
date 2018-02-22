require_relative('../models/student.rb')
require_relative('../models/house.rb')

House.delete_all()
Student.delete_all()

house1 = House.new({
  "name" => "Gryffindor",
  "logo_url" => "https://vignette.wikia.nocookie.net/harrypotter/images/8/8e/0.31_Gryffindor_Crest_Transparent.png/revision/latest?cb=20161124074004"
  })

house2 = House.new({
  "name" => "Ravenclaw",
  "logo_url" => "https://vignette.wikia.nocookie.net/harrypotter/images/2/29/0.41_Ravenclaw_Crest_Transparent.png/revision/latest?cb=20161020182442"
  })

house3 = House.new({
  "name" => "Hufflepuff",
  "logo_url" => "https://vignette.wikia.nocookie.net/harrypotter/images/5/50/0.51_Hufflepuff_Crest_Transparent.png/revision/latest?cb=20161020182518"
  })

house4 = House.new({
  "name" => "Slytherin",
  "logo_url" => "https://vignette.wikia.nocookie.net/harrypotter/images/d/d3/0.61_Slytherin_Crest_Transparent.png/revision/latest?cb=20161020182557"
  })

house1.save()
house2.save()
house3.save()
house4.save()

student1 = Student.new({
  "first_name" => "Harry",
  "second_name" => "Potter",
  "house_id" => house1.id(),
  "age" => 13
})

student2 = Student.new({
  "first_name" => "Ron",
  "second_name" => "Ginger",
  "house_id" => house1.id(),
  "age" => 13
})

student3 = Student.new({
  "first_name" => "Malfoy",
  "second_name" => "Angry",
  "house_id" => house4.id(),
  "age" => 13
})

student4 = Student.new({
  "first_name" => "Hermiony",
  "second_name" => "Granger",
  "house_id" => house1.id(),
  "age" => 13
})

student5 = Student.new({
  "first_name" => "Tom",
  "second_name" => "Tall",
  "house_id" => house3.id(),
  "age" => 14
})

student6 = Student.new({
  "first_name" => "Angela",
  "second_name" => "Plughole",
  "house_id" => house2.id(),
  "age" => 15
})

student7 = Student.new({
  "first_name" => "Stewart",
  "second_name" => "Little",
  "house_id" => house3.id(),
  "age" => 11
})

student1.save()
student2.save()
student3.save()
student4.save()
student5.save()
student6.save()
student7.save()
