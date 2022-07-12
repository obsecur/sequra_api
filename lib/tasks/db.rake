# frozen_string_literal: true

namespace :db do
  desc "populate data for SeQura api"
  task populate: :environment do
    # Array Objects
    shopper_names = [
      "Pepe",
      "Karina",
      "Claudia",
      "Lidia",
      "Diego",
      "Luz"
    ]

    merchant_names = [
      "Walter",
      "Mariel",
      "Dana",
      "Roque",
      "Franco",
      "Branko"
    ]

    def order_amount(shopper_name)
      case shopper_name
      when "Juan"
        50.00
      when "Pepe"
        10.15
      when "Pablo"
        300.00
      when "Karina"
        1000.00
      when "Claudia"
        1000.00
      when "Lidia"
        300.00
      when "Diego"
        10.15
      when "Luz"
        50.00
      end
    end

    date_orders = [
      DateTime.current,
      DateTime.current - 1,
      DateTime.current - 2,
      DateTime.current - 3,
      nil
    ]

    # Shoppers
    shopper_names.count.times do |i|
      shopper_name = shopper_names[i]
      merchant_name = merchant_names[i]

      shoper_params = {
          shopper: {
              name: shopper_name
          }
      }

      # Merchants
      merchant_params = {
          merchant: {
              name: merchant_name
          }
      }

      shopper = Shopper.create!(shoper_params[:shopper])
      merchant = Merchant.create!(merchant_params[:merchant])
      amount = order_amount(shopper_name)

      order_params = {
        order: {
          shopper: shopper,
          merchant: merchant,
          amount: amount,
          completed_at: date_orders.sample
        }
    }
      order = Order.create!(order_params[:order])
    end
  end
end
