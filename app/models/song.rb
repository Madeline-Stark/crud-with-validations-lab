class Song < ApplicationRecord
    validates :title, presence: true
    # from docs: validates :boolean_field_name, inclusion: [true, false]
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released
    validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }, if: :released
    validates :title, uniqueness: {
        scope: [:release_year, :artist_name]
    }

end
