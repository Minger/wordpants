Bootstrapper.for :production do |b|
end

Bootstrapper.for :development do |b|
  b.truncate_tables :all
  2.times { |i| Factory(:user, :login => "guy#{i}") }
end

Bootstrapper.for :test do |b|
end

