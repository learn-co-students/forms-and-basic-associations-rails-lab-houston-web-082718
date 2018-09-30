class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def artist_name
    artist ? artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def note_contents=(notes_params)
    notes_params.each do |note|
      self.notes.build(content: note) unless note == ""
    end
  end

  def note_contents
    notes.map {|note| note.content}
  end
end
