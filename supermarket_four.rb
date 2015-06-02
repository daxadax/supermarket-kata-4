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
      discounts.each do |items, discount|
        log.gsub!(items, "#{discount} ")
      end
      prices.each do |item, cost|
        log.gsub!(item, "#{cost} ")
      end
      log.split.map(&:to_i).reduce(:+)
    end

    private

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
