require 'test/unit'
require File.expand_path('../../lib/genetic_algorithm', __FILE__)

class GeneticAlgorithmTests < Test::Unit::TestCase

  def test_classes_exist
    assert ga = GeneticAlgorithm.new
  end

end