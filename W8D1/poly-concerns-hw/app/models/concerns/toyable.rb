module Toyable
    extend ActiveSupport::Concern

    included do

        # has_many :toyings, as: :toyable
        # has_many :toys, through: :toyings

        has_many :toys, as: :toyable

    end

    def receive_toy(name)
        @toy = Toy.find_by(name: name)
        debugger
        self.toys = @toy unless @toy.nil?
    end

end
