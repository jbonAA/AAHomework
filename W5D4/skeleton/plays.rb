require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.find_by_title(title)
    PlayDBConnection.instance.execute(<<-SQL
      SELECT
        *
      FROM
        plays
      WHERE
        plays.title = 'title'
    )SQL
  end

  def self.find_by_playwright(name)
    # PlayDBConnection.instance.execute(<<-SQL
    #   SELECT
    #     *
    #   FROM
    #     plays
    #   WHERE
    #     id IN 
    #     (SELECT
    #     playwrights.id
    #   FROM
    #     playwrights)
    #   WHERE
    #     playwrights.name = 'name')

    # SQL   
  end

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    )SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwrights_id = ?
      WHERE
        id = ?
    SQL
  end
end


class Playwright

  attr_accessor :id, :name, :birth_year

  def self.all
    data = PlaywrightDBConnection.instance.execute(SELECT * FROM playwrights)
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    PlaywrightDBConnection.instance.execute(<<-SQL
    SELECT
      *
    FROM
      playwrights
    WHERE
      playwrights.name = 'name'
    )SQL
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} already in database" if self.id
    PlaywrightDBConnection.instance.execute(<<-SQL, self.id, self.name, self.birth_year)
    INSERT INTO
      playwrights (id, name, birth_year)
    VALUES
      (?, ?, ?)
    SQL
    self.id = PlaywrightDBConnection.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlaywrightDBConnection.instance.execute(<<-SQL, self.id, self.name, self.birth_year)
    UPDATE
      playwrights
    SET
      name = ?,
      birth_year = ?
    WHERE
      id = ?
    SQL
  end

  def get_plays(name)
    PlaywrightDBConnection.instance.execute(<<-SQL
    SELECT
      *
    FROM
      plays
    JOIN
      playwrights ON plays.playwright_id = playwrights.id
    WHERE
      playwrights.name = 'name'
    )SQL
  end

end
