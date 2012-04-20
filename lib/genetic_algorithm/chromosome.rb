class GeneticAlgorithm::Chromosome

  attr_reader :chromosome, :fitness

  # Called on construction
  def initialize( arr = [] )
    @chromosome = arr
    @fitness = 0.0
    self
  end

  # Set @chromosome to a random array using the defined genes
  def random( length = 20 )
    @chromosome = []
    length.times { @chromosome << genes.sample }
    self
  end

  # Returns an Array defining the alphabet of genes used in a Chromosome
  def genes
    [0,1]
  end

  # Sets @fitness to a float representing the fitness of this chromosome
  # Where 1 is optimum fitness
  # and 0 is minimum fitness
  # MUST be overridden by inheriting classes
  def fitness_function
    @fitness = 0.0
  end

  # Randomly mutate the chromosome with probability rate
  def mutate( rate = 0.02 )
    @chromosome.map! { |gene| (rand < rate) ? genes.sample : gene }
  end

  # Returns a string representation of the Chromosome
  def to_s
    "<Chromosome> #{@chromosome.to_s} #{@fitness}"
  end
end
