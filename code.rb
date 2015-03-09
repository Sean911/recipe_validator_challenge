require 'pry'

class Ingredient
  def initialize( quantity, unit, name )
    @quantity = quantity
    @unit = unit
    @name = name
  end

  # attr_reader :name

  def summary
    "#{@quantity} #{@unit} #{@name}"
  end

  def is_it_safe?
    safe_array = ["brussels sprouts", "spinach", "eggs", "milk", "tofu", "seitan",
      "bell peppers", "quinoa", "kale", "chocolate", "beer", "wine", "whiskey"]
      #name = name.downcase
      #binding.pry
      safe_array.include?( @name.downcase )
  end

end


class Recipe
  def initialize( name, instructions, ingredients )
    @name = name
    @instructions = instructions
    @ingredients = ingredients
  end

  def summary
    puts @name
    puts
    puts "Ingredients"
    @ingredients.each do |ingredient|
      puts " - #{ingredient.summary}"
    end
    puts
    puts "Instructions"
    counter = 1
    @instructions.each do |item|
      puts "#{counter}. #{item}"
      counter += 1
    end
  end

  def safe?
      binding.pry
      #safe_array.include?( @name.downcase )
      counter = 0
      @ingredients.each do |ingredient_name|
        unless ingredient_name.is_it_safe?
          counter += 1
        end
      end
      counter == 0
  end

end

name = "Roasted Brussels Sprouts"

ingredients = [
    Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
    Ingredient.new(3.0, "tbspn(s)", "Whiskey"),
    Ingredient.new(0.75, "tspn(s)", "Whiskey"),
    Ingredient.new(0.5, "tspn(s)", "Kosher salt")
]

instructions = [
    "Preheat oven to 400 degrees F.",
    "Cut off the brown ends of the Brussels sprouts.",
    "Pull off any yellow outer leaves.",
    "Mix them in a bowl with the olive oil, salt and pepper.",
    "Pour them on a sheet pan and roast for 35 to 40 minutes.",
    "They should be until crisp on the outside and tender on the inside.",
    "Shake the pan from time to time to brown the sprouts evenly.",
    "Sprinkle with more kosher salt ( I like these salty like French fries).",
    "Serve and enjoy!"
    ]

recipe = Recipe.new( name, instructions, ingredients )

recipe.summary

bs = Ingredient.new(1.5, "lb(s)", "Brussels sprouts");
wh = Ingredient.new(1.5, "bottle(s)", "Whiskey");
pot = Ingredient.new(1.5, "lb(s)", "potatoes");
#puts recipe.safe?

if recipe.safe?
  puts "Safe to Eat"
else
  puts "Danger!!! Do not eat!!!"
end
