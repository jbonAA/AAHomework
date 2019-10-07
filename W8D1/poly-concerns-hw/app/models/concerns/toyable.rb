module Toyable
    extend ActiveSupport::Concern

    included do

        has_many :toyings, as: :toyable
        has_many :toys, through: :toyings

    end

    def receive_toy(name)
        @toy = Toy.find_by(name: name)
        self.toys = @toy
    end

end
