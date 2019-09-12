require 'rspec'
require 'dessert'


=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("cake", 10, :chef) }
  
  

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end
      
    it "sets a quantity" do
      expect(dessert.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      raise ArgumentError unless dessert.quantity.class == Integer
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to_not include('milk')
      dessert.add_ingredient('milk')
      expect(dessert.ingredients).to include('milk')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(dessert.ingredients)


    end
   
  end

  describe "#eat" do
    # before(:each) { dessert.eat(4) }

    it "subtracts an amount from the quantity" do
      expect(dessert.eat(4)).to eq(6)
    end
    

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(1000) }.to raise_error(RuntimeError)
    end
   
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      dessert.serve
      expect(dessert.chef).to receive(titleize)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
    expect(chef).to receive(bake(dessert))
  end
end
