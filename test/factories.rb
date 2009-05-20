Factory.define :user do |user|
  user.login { Forgery(:internet).user_name }
  user.email { Forgery(:internet).email_address }
  user.password { Forgery(:basic).password }
  user.password_confirmation { |u| u.password }
end

Factory.define :seat do |seat|
  seat.association :game
  seat.association :user
end

Factory.define :game do |game|
  game.name { Forgery(:word).word }
  game.association :board
end

Factory.define :board do |board|
end
