module SupermarketFour
  class Checkout
    def initialize(rules)
      @rules = rules
      @log = ''
    end

    def scan(items)
      add_to_log items
    end

    def total
      return 0 if log.empty?
      items = log.dup.split(//).sort.join
      calculate_total(items)
    end

    private

    def calculate_total(all_items)
      discounts.each do |items, discount|
        all_items.gsub!(items, "#{discount} ")
      end
      prices.each do |item, cost|
        all_items.gsub!(item, "#{cost} ")
      end
      all_items.split.map(&:to_i).reduce(:+)
    end

    def add_to_log(items)
      @log += items
    end

    def log
      @log
    end

    def discounts
      @discounts ||= @rules.select {|item, price| item.length > 1}
    end

    def prices
      @prices ||= @rules.select {|item, price| item.length == 1}
    end
  end
end
