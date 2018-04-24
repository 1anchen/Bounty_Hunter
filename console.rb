require("pry")
require_relative("bounty_hunter")

BountyHunter.delete_all()

hunt_request1 = BountyHunter.new({
  "name" => "Yang",
  "species" => "Human",
  "bounty_value" => 50000,
  "danger_level" => "low"
})
hunt_request1.save()

hunt_request2 = BountyHunter.new({
  "name" => "Rachel",
  "species" => "Alien",
  "bounty_value" => 1000000,
  "danger_level" => "high"
})
hunt_request2.save()

hunt_request3 = BountyHunter.new({
  "name" => "Davina",
  "species" => "Unknown",
  "bounty_value" => 10,
  "danger_level" => "medium"
})
hunt_request3.save

bounties = BountyHunter.all()


binding.pry
nil
