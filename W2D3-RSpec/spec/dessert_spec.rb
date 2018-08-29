require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Ray") }
  let(:cheese_cake) { Dessert.new("cake", 8, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cheese_cake.type).to eq("cake")
    end
    it "sets a quantity" do
      expect(cheese_cake.quantity).to eq(8)
    end
    it "starts ingredients as an empty array" do
      expect(cheese_cake.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "ten", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
        cheese_cake.add_ingredient("Cream")
        expect(cheese_cake.ingredients).to include("Cream")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["Cream", "Chocolate", "Egg", "Apple Jam"]
      ingredients.each do |each|
        cheese_cake.add_ingredient(each)
      end
      cheese_cake.mix!
      expect(cheese_cake.ingredients).not_to eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(cheese_cake.eat(2)).to eq(6)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {cheese_cake.eat(10)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive(:titleize).and_return("Chef Ray the Great Baker")
      expect(cheese_cake.serve).to eq("Chef Ray the Great Baker has made 8 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cheese_cake)
      cheese_cake.make_more
    end
  end
end
