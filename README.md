Genetic Algorithm
=================

This is a base library for building [genetic algorithms][1].

The library contains two classes for you to work with: `GeneticAlgorithm` and `GeneticAlgorithm::Chromosome`.

You start by defining your own chromosome class which inherits `GeneticAlgorithm::Chromosome`. The only requirement is that you define the `fitness_function` method.

The `fitness_function` method must set `@fitness` to the fitness of the chromosome instance. Fitness is a normalised `Float` value, where 1 is maximum fitness and 0 is minimum fitness.

    class MyChromosome < GeneticAlgorithm::Chromosome
      def fitness_function
        @fitness = rand # Obviously a random fitness is nonsense
      end
    end

Next you create a `GeneticAlgorithm` object and populate it with chromosomes.

    ga = GeneticAlgorithm.new

    100.times do
      ga.population << MyChromosome.new([1,0,1,0,1,0])
    end

Now evolve the population for a number of generations.

    1000.times do |generation|
      puts "Evolving generation #{generation}"
      ga.evolve
    end

For a more comprehensive and functioning example checkout the `demos` folder.

The `GeneticAlgorithm::Chromosome` class provides some minimal defaults, you are encouraged to override methods where you see fit. In particular `genes`, but perhaps also `mutate` and `to_s` depending on your implementation. Read the comments in the source for more info.

Or [email me][2].

[1]: http://en.wikipedia.org/wiki/Genetic_algorithm
[2]: mailto:craig@craig-russell.co.uk