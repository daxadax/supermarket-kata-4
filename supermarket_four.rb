module SupermarketFour
  class Checkout
    def initialize(rules)
      @rules = rules
      @log = ''
    end

    def scan(items)
      @log += items
    end

    def total
      return 0 if @log.empty?
      items = @log.dup.split(//).sort.join
      calculate_total(items)
    end

    private

    def calculate_total(all_items)
      prices.each { |item, cost| all_items.gsub!(item, "#{cost} ") }
      all_items.split.map(&:to_i).reduce(:+)
    end

    def prices
      @prices ||= @rules.sort_by { |item, cost| item.length }.reverse
    end
  end
end
