require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:home)
end

get("/dice/2/6") do
  @rolls = []
  @sum = 0

  2.times do
    die = rand(1..6)
    @rolls.push(die)
  end
	@rolls.each do |dice_roll|
    @sum += dice_roll
  end
  erb(:two_six)
end

get("/dice/2/10") do
  @rolls = []
  @sum = 0

  2.times do
    die = rand(1..20)
    @rolls.push(die)
  end
  @rolls.each do |dice_roll|
    @sum += dice_roll
  end
  erb(:two_ten)
end

get("/dice/1/20") do
  @die = rand(1..20)

  @outcome = "#{@die}"

  erb(:one_twenty)
end

get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die

  outcome = "You rolled a #{first_die}, a #{second_die}, a #{third_die}, and a #{fourth_die} for a total of #{sum}"

  erb(:five_four)
end

get("/dice/100/6") do
  @rolls = []

  100.times do
    die = rand(1..6)

    @rolls.push(die)
  end

  erb(:one_hundred_six)
end
