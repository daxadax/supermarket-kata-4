module SupermarketFour
  class Checkout
    def initialize(rules)
      @rules = rules.sort_by {|k,v| k.length }.reverse
      @log = ''
    end

    def scan(items)
      @log += items
    end

    def total
      return 0 if @log.empty?
      items = @log.dup.split(//).sort.join
      @rules.each { |item, cost| items.gsub!(item, "#{cost} ") }
      items.split.map(&:to_i).reduce(:+)
    end
  end
end
