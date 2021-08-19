# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


class Seed

  def self.begin
    seed = Seed.new
    seed.generate_boards
    seed.generate_posts
  end

  def generate_boards
    25.times do |i|
      board = Board.create!(
        name: Faker::Hipster.word
      )
    end
  end

  def generate_posts
    100.times do |i|
      post = Post.create!(
        title: Faker::Book.author,
        body: Faker::Movie.quote,
        username: Faker::Name.first_name,
        author: Faker::Name.name,
        board_id: Faker::Number.between(from:1, to: 25),
        updated_at: Faker::Time.between(from: DateTime.now, to: DateTime.now + 22, format: :long)
      )
      # puts "Quote #{i}: Author is #{quote.author} and quotation is '#{quote.content}'."
    end
  end
end

Board.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(Board.table_name)
Seed.begin