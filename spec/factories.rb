FactoryBot.define do
  factory(:board) do
    name {Faker::Name.name}
  end
  factory(:post) do
    title {Faker::Name.name}
    body  {Faker::Hipster.words(count: 5..20)}
    username {Faker::Movie.quote }
    author {Faker::Book.author}
    board_id {Faker::Number.between(from:1, to:3)}
  end
end