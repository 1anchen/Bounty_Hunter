require("pg")

class BountyHunter

  attr_accessor :name, :species, :bounty_value, :danger_level

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @species = options["species"]
    @bounty_value = options["bounty_value"].to_i
    @danger_level = options["danger_level"]
  end

  def save()
    db = PG.connect({
      dbname: "bounty_hunter",
      host: "localhost"
    })
    sql = "INSERT INTO bounty_hunter
        (name,
        species,
        bounty_value,
        danger_level)
      VALUES
        ($1, $2, $3, $4) RETURNING id"
    values = [@name, @species, @bounty_value, @danger_level]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"].to_i
    db.close() 
  end




end
