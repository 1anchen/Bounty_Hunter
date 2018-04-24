require("pry")
require_relative("bounty_hunter")

hunt_request1 = BountyHunter.new({
  "name" => "Yang",
  "species" => "Human",
  "bounty_value" => 50000,
  "danger_level" => "low"
})
