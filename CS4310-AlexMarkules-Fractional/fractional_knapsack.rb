require_relative "max_heap"
require_relative "knapsack"
require_relative "node"
class FractionalKnapsack
  attr_accessor :dataSet, :heap, :knapsack
  def initialize dataSet, maxWeight
    @dataSet = dataSet
    @heap = heapify @dataSet
    @knapsack = knapsackify @heap, maxWeight
  end
  def heapify dataSet
    i = 0
    heap = MaxHeap.new
    while i<dataSet.size
      arr = dataSet[i]
      benefit = arr[0]
      weight = arr[1]
      heap.addNode benefit, weight
      i = i+1
    end
    return heap
  end
  def knapsackify heap, max
    knapsack = Knapsack.new max
    cont = true
    while heap.getRoot != nil && cont
      node = heap.getRoot
      if node.getWeight<(max - knapsack.getCurrentWeight)
        knapsack.addNode node, node.getWeight
      else
        knapsack.addNode node, (max - knapsack.getCurrentWeight)
        cont = false
      end
      heap.removeRoot
    end
    #knapsack.printKnapsack
  end
end