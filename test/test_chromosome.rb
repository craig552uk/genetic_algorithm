require 'test/unit'
require File.expand_path('../../lib/genetic_algorithm', __FILE__)

class ChromosomeTests < Test::Unit::TestCase

  def test_class_exists
    assert chrom = GeneticAlgorithm::Chromosome.new
  end

  def test_chromosome_population
    assert chrom = GeneticAlgorithm::Chromosome.new
    assert_equal [], chrom.chromosome
    assert chrom = GeneticAlgorithm::Chromosome.new([0,1,0,1,0,1,0,1])
    assert_equal [0,1,0,1,0,1,0,1], chrom.chromosome
    assert chrom = GeneticAlgorithm::Chromosome.new
    assert chrom.random
    assert_equal 20, chrom.chromosome.length
    assert chrom = GeneticAlgorithm::Chromosome.new
    assert chrom.random(10)
    assert_equal 10, chrom.chromosome.length
  end

  def test_custom_genes
    assert chrom_a = MyChromA.new
    assert chrom_b = MyChromB.new
    assert_equal [0,1], chrom_a.genes
    assert_equal [1,2], chrom_b.genes
  end

  def test_custom_fitness_function
    assert chrom_a = MyChromA.new
    assert chrom_b = MyChromB.new
    chrom_a.fitness_function
    chrom_b.fitness_function
    assert_equal 0.0, chrom_a.fitness
    assert_equal 1.0, chrom_b.fitness
  end

  def test_custom_mutate
    assert chrom_a = MyChromA.new.random
    assert chrom_b = MyChromB.new.random
    chrom_a_old = Array.new(chrom_a.chromosome)
    chrom_b_old = Array.new(chrom_b.chromosome)
    chrom_a.mutate 0.5
    chrom_b.mutate
    assert_not_equal chrom_a_old, chrom_a.chromosome
    assert_not_equal chrom_b_old, chrom_b.chromosome
  end
end

## Dummy Classes ##

# Inherits defaults
class MyChromA < GeneticAlgorithm::Chromosome
end

# Overrides defaults
class MyChromB < GeneticAlgorithm::Chromosome
  def genes
    [1,2]
  end

  def fitness_function
    @fitness = 1.0
  end

  def mutate
    @chromosome.map! { genes.sample }
  end
end