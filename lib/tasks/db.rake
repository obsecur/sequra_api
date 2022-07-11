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
        4.00
      when "Pepe"
        59.00
      when "Pablo"
        1540.15
      when "Karina"
        150.45
      when "Claudia"
        15.34
      when "Lidia"
        560.12
      when "Diego"
        650.10
      when "Luz"
        200.75
      end
    end

    # Merchants
    merchant_names.count.times do |i|
      
    end

    # Shoppers
    shopper_names.count.times do |i|
      shopper_name = shopper_names[i]
      merchant_name = merchant_names[i]

      shoper_params = {
          shopper: {
              name: shopper_name
          }
      }

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
          amount: amount
        }
    }
      order = Order.create!(order_params[:order])
    end

    # Set some order as completed
    Order.first.completed!
    Order.second.completed!
    Order.third.completed!
  end
end
