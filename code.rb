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

  def self.parse(ingredient_string)
    tokens = ingredient_string.split(" ")
    quantity = tokens[0].to_i
    unit = tokens[1]
    name = tokens[2]

    Ingredient.new( quantity, unit, name )
  end

end


class Recipe
  def initialize( name, instructions, ingredients )
    @name = name
    @instructions = instructions
    @ingredients = ingredients
  end

  def summary
    summary = "#{@name}\n\n"
    summary += "Ingredients\n"
    @ingredients.each do |ingredient|
      summary += " - #{ingredient.summary}\n"
    end
    summary += "\nInstructions\n"
    @instructions.each_with_index do |item, index|
      summary += "#{index + 1}. #{item}\n"
    end
    if safe?
      summary += "\nThis is safe to eat."
    else
      summary += "\nDanger! DO NOT EAT!!!"
    end
  end

  def safe?
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
    Ingredient.new(0.5, "tspn(s)", "Kosher salt"),
    Ingredient.parse("1.0 cup(s) sugar")
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

puts recipe.summary
#
# bs = Ingredient.new(1.5, "lb(s)", "Brussels sprouts");
# wh = Ingredient.new(1.5, "bottle(s)", "Whiskey");
# pot = Ingredient.new(1.5, "lb(s)", "potatoes");
# #puts recipe.safe?
