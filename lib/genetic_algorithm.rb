require_relative 'genetic_algorithm/version'
require_relative 'genetic_algorithm/chromosome'

class GeneticAlgorithm

  attr_accessor :population

  # Build new genetic algorithm
  #
  # :elite   float: proportion of population allowed to breed in each generation
  # :mutate  float: mutation rate
  def initialize(args={})
    @params = {:elite => 0.1, :mutate => 0.02}
    @params.merge! args
    @population = []
  end

  # Evolves one generation of the algorithm
  # NB: elite chromosomes survive between generations
  def evolve
    # For each non elite chromosome in the population
    @population[non_elite].each_index do |i| 
      # Replace with a child from two elite parents
      @population[i] = breed @population[elite].sample, @population[elite].sample
      # Mutate the child
      @population[i].mutate @params[:mutate]
    end
    # Calculate the fitness of each chromosome
    @population.each  { |c| c.fitness_function }
    # Sort the population by fitness
    @population.sort! { |a, b| b.fitness <=> a.fitness }
  end

  # Return a new chromosome generated from 
  # the single point random crossover of two other chromosomes
  def breed(chrom_a, chrom_b)
    len  = chrom_a.chromosome.length
    x_i  = [*0..len].sample
    head = chrom_a.chromosome.slice(0,x_i)
    tail = chrom_b.chromosome.slice(x_i,len)
    return chrom_a.class.new((head << tail).flatten)
  end

  # Return the fittest member of the population
  def fittest
    @population[0]
  end

  # Return true if the optimum solution has been found
  def solved?
    self.fittest.fitness >= 1.0
  end

  private

  # Return the elite range population
  def elite
    i = @params[:elite] * @population.length
    (0..i-1)
  end

  # Return the non-elite range of the population
  def non_elite
    i = @params[:elite] * @population.length
    (i..@population.length)
  end
end