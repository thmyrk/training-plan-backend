# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = []
users << User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# workouts
workouts = []
workouts << Workout.create!(name: "Full body workout", user: users[0])

# tags
tags = []
tags << Tag.create!(name: "Powerlifting")
tags << Tag.create!(name: "Legs")
tags << Tag.create!(name: "Compound")
tags << Tag.create!(name: "Accessory")

# exercises
exercises = []
exercises << Exercise.create!(name: "Squat")
exercises << Exercise.create!(name: "Bench press")

# exercises tags
ExerciseTag.create!(exercise: exercises[0], tag: tags[0])
ExerciseTag.create!(exercise: exercises[0], tag: tags[1])
ExerciseTag.create!(exercise: exercises[1], tag: tags[1])
ExerciseTag.create!(exercise: exercises[1], tag: tags[2])

# workout exercises
WorkoutExercise.create!(exercise: exercises[0], workout: workouts[0], sets: 5, reps: 5)
WorkoutExercise.create!(exercise: exercises[1], workout: workouts[0], sets: 3, reps: 10)
