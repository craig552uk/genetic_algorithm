require 'genetic_algorithm'

# Demo of genetic_algorithm gem showcasing the Weasel Program
# http://en.wikipedia.org/wiki/Weasel_program
#
# Strictly speaking, Dawkins' original program did not model breeding between 
# chromosomes, which is done here.

class WeaselChromosome < GeneticAlgorithm::Chromosome

  # Define genes as upper-case alphabet and a space
  def genes
    " ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('')
  end

  # Fitness is similarity between chromosome string and target string
  # Returns a normalised float where
  #   1 is maximum fitness (the best solution)
  #   0 is minimum fitness
  def fitness_function
    tally = 0.0
    @chromosome.each_index { |i| tally += 1 if @chromosome[i] == TARGET[i] }
    @fitness = tally / TARGET.length
  end

  # Override to provide nice output for monitoring
  def to_s
    "#{@chromosome.join} #{@fitness}"
  end
end

# Target string
TARGET = "METHINKS IT IS LIKE A WEASEL"
puts "     #{TARGET}"

# Create a GA and populate with 100 random chromosomes
ga = GeneticAlgorithm.new
100.times { ga.population << WeaselChromosome.new.random(TARGET.length) }

# Evolve for up to 1000 generations
1000.times do |generation|
  ga.evolve
  # Show the fittest
  puts "#{"%-4d" % generation} #{ga.fittest.inspect}"
  # Stop if we have a solution
  Process.exit if ga.solved?
end
