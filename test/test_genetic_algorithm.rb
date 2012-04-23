require 'test/unit'
require File.expand_path('../../lib/genetic_algorithm', __FILE__)

class GeneticAlgorithmTests < Test::Unit::TestCase

  def test_classes_exist
    assert ga = GeneticAlgorithm.new
  end

  def test_constructor_and_defaults
    assert ga = GeneticAlgorithm.new
    assert_equal ga.params[:mutate], 0.02
    assert_equal ga.params[:elite], 0.1

    assert ga = GeneticAlgorithm.new({:elite => 0.5})
    assert_equal ga.params[:mutate], 0.02
    assert_equal ga.params[:elite], 0.5

    assert ga = GeneticAlgorithm.new({:mutate => 0.5})
    assert_equal ga.params[:mutate], 0.5
    assert_equal ga.params[:elite], 0.1

    assert ga = GeneticAlgorithm.new({:mutate => 0.5, :elite => 0.5})
    assert_equal ga.params[:mutate], 0.5
    assert_equal ga.params[:elite], 0.5
  end

  def test_population
    assert ga = GeneticAlgorithm.new
    assert_respond_to ga, :population
    assert_equal Array, ga.population.class
  end

  def test_other_methods_exist
    # Not the most robust testing but...
    assert ga = GeneticAlgorithm.new
    assert_respond_to ga, :evolve
    assert_respond_to ga, :breed
    assert_respond_to ga, :fittest
    assert_respond_to ga, :solved?
  end

end

# Make @params accessible for tests
class GeneticAlgorithm
  attr_reader :params
end