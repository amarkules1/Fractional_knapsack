require_relative "fractional_knapsack"
require 'benchmark'
require_relative "max_heap"
require_relative "knapsack"
require_relative "node"
class BMark
  fk = FractionalKnapsack.new [[1,1]], 1
  file = File.open('output10000-100000.csv', 'w')

  inparray = Array.new
  (1..10).each do |size|
    inparray.clear
    (size*10000).times do
      inparray.push([rand(100)+1,rand(50)+1])
    end
    heap = fk.heapify inparray
    time = Benchmark.measure do |i|
      10.times do
        fk.knapsackify heap, (size * 250000)
      end
    end
    file.write("#{size*10000},#{time.real/10}\n")
  end

  file.close
end