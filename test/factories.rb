Factory.define :user do |user|
  user.login { Forgery(:internet).user_name }
  user.email { Forgery(:internet).email_address }
  user.password 'secret'
  user.password_confirmation 'secret'
end

Factory.define :seat do |seat|
  seat.association :game
  seat.association :user
end

Factory.define :game do |game|
  game.name { Forgery(:word).word }
  game.association :board
  game.seats_attributes do
    [{:user => Factory(:user)}, {:user => Factory(:user)}]
  end
end

Factory.define :board do |board|
end
