# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'bcrypt'
include ActiveModel
cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
password_admin = BCrypt::Password.create('admin', cost: cost)
password_student = BCrypt::Password.create('student', cost: cost)

genders = Gender.create([{name: 'male'},{name: 'female'}])
users=User.create([{user_name: 'admin', password: 'admin', password_confirmation:'admin', email: 'admin@123.com', power: 2, gender: genders.first},
    {user_name: 'student', password: 'student', password_confirmation:'student', email: 'student@123.com', power: 1, gender: genders.second}])
    
colleges=College.create([{name: 'Computer Science'}])

majors=Major.create([{name: 'Software Engineering', college: colleges.first}])

courses=Course.create([{name: 'Advanced Software Engineering', major: majors.first, year: Date.today}])

teachers=Teacher.create([{name: 'WeiJun', college: colleges.first, gender: genders.first, email:'weijun@123.com'}])

comments=Comment.create([{content: 'I love it', user: users.second, course: courses.first}])

reviews=Review.create([{content: 'Agreed!', comment: comments.first, user: users.second}])

grades=Grade.create([{course: courses.first, user: users.second, year: Date.today}])

marks=Mark.create([{score: 5, course: courses.first, user:users.second}])

messages=Message.create([{content: 'Welcome!', from_id: 1, to_id: 2}])
