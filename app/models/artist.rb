class Artist < ActiveRecord::Base
  # add associations here
  has_many :songs
  has_many :genres, through: :songs


  validates :name, length: { minimum: 2 }
    
    validates :name, presence: true


    def song_count
      self.songs.count
    end
end
