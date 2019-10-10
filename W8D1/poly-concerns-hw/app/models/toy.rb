class Toy < ApplicationRecord
    # validates :name, presence: true, uniqueness: true
    # validates :toyable_id, presence: true, uniqueness: true
    # validates :toyable_type, presence: true, uniqueness: true
    validates :name, uniqueness: {scope: [:toyable]}

    belongs_to :toyable, polymorphic: true
end
