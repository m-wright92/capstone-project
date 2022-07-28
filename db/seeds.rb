# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# Post.destroy_all
# Comment.destroy_all
# CommentReaction.destroy_all
# PostReaction.destroy_all
# Friendship.destroy_all


# 15.times do
#   User.create!(email: Faker::Internet.email,
#                 password: 'password',
#                 birth_date: Faker::Date.between(from: '1930-01-01', to: '2000-01-01'),
#                 given_name: Faker::Name.first_name,
#                 family_name: Faker::Name.last_name,
#                 phone_number: Faker::PhoneNumber.phone_number)
#   p "Created #{User.count} users"                  
# end

# 10.times do
#   Post.create!(user_id: User.all.sample.id,
#                 post_body: Faker::Lorem.paragraph)
#   p "Created #{Post.count} posts"
# end

# 20.times do
#   Comment.create!(user_id: User.all.sample.id,
#                   post_id: Post.all.sample.id,
#                   comment_body: Faker::Lorem.paragraph)
#   p "Created #{Comment.count} comments"
# end

# 30.times do
#   PostReaction.create!(user_id: User.all.sample.id,
#                        post_id: Post.all.sample.id,
#                        reaction_type: %w[like dislike].sample)
#   p "Created #{PostReaction.count} post reactions"           
# end

# 30.times do
#   CommentReaction.create!(user_id: User.all.sample.id,
#                           comment_id: Comment.all.sample.id,
#                           reaction_type: %w[like dislike].sample)
#   p "Created #{CommentReaction.count} comment reactions"
# end

# 10.times do
#   Friendship.create!(user_id: User.all.sample.id,
#                       friend_id: User.all.sample.id)
#   p "Created #{Friendship.count} friendships"
# end