require_relative "node"
class Knapsack
  attr_accessor :max, :currentWeight, :values, :amounts, :value
  def initialize max
    @max = max
    @currentWeight = 0
    @values = Array.new
    @amounts = Array.new
    @value = 0
  end
  def getMax
    return @max
  end
  def setMax max
    @max = max
  end
  def setCurrentWeight w
    @currentWeight = w
  end
  def getCurrentWeight
    return @currentWeight
  end
  def addNode node, amount
    @values.push node.getValue
    @amounts.push amount
    @currentWeight = @currentWeight + amount
    @value = @value + (node.getValue * amount)
  end
  def printKnapsack
    puts("Weight: " + @currentWeight.to_s)
    puts("Max Weight: " + @max.to_s)
    puts("Value in Knapsack: " + @value.to_s)
    i = 0
    while i<@values.size
      val = @values[i]
      puts("Node: " + i.to_s + " Value: " + val.to_s + " Amount: " + @amounts[i].to_s + " Total Value: " + (val * @amounts[i]).to_s)
      i = i + 1
    end
  end
end