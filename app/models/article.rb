class Article < ApplicationRecord
    belongs_to :owner

    def get_price_with_currency
        self.price.to_s + self.currency
    end
end
