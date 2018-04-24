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

  # CLASS METHODS

  def update()
    db = PG.connect({
      dbname: "bounty_hunter",
      host: "localhost"
      })
    sql = "UPDATE bounty_hunter
    SET (name, species, bounty_value, danger_level) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@name, @species, @bounty_value, @danger_level, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def delete_one()
    db = PG.connect({
      dbname: "bounty_hunter",
      host: "localhost"
      })
    sql = "DELETE FROM bounty_hunter WHERE id = $1"
    db.prepare("delete_one", sql)
    db.exec_prepared("delete_one", [@id])
    db.close()
  end

  def BountyHunter.delete_all()
    db = PG.connect({
      dbname: "bounty_hunter",
      host: "localhost"
      })
    sql = "DELETE FROM bounty_hunter"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end

  def BountyHunter.all()
    db = PG.connect({
      dbname: "bounty_hunter",
      host: "localhost"
      })
    sql = "SELECT * FROM bounty_hunter"
    db.prepare("all", sql)
    bounty_hashes = db.exec_prepared("all")
    db.close()
    bounties = bounty_hashes.map {|bounty_hash| BountyHunter.new(bounty_hash) }
    return bounties
  end

  def found_one()
    db = PG.connect({
      dbname: "bounty_hunter",
      host: "localhost"
      })
    sql = "SELECT name FROM bounty_hunter WHERE name = 'Yang'"
    db.prepare("found_one", sql)
    db.exec_prepared("found_one")
    db.close()
  end


end
