module Spree
  module Stock
    class Quantifier
      attr_reader :stock_items, :variant

      def initialize(variant)
        @variant = variant
        @stock_items = Spree::StockItem.joins(:stock_location).
                         where(variant_id: @variant, Spree::StockLocation.table_name => { active: true })
      end

      def total_on_hand
        if variant.should_track_inventory?
          stock_items.map(&:count_on_hand).sum
        else
          Float::INFINITY
        end
      end

      def backorderable?
        stock_items.any?(&:backorderable)
      end

      def can_supply?(required = 1)
        variant.available? && (total_on_hand >= required || backorderable?)
      end

    end
  end
end
