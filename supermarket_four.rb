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
    end

    private

    def add_to_log(items)
      @log += items
    end

    def log
      @log
    end
  end
end
