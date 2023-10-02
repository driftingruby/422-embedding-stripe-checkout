class Order < ApplicationRecord
  enum status: {
    pending: 0,
    paid: 1
  }
end
