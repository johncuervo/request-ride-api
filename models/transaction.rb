# models/transaction.rb
class Transaction < ActiveRecord::Base
# == Associations =========================================================
  belongs_to :driver
  belongs_to :rider
  belongs_to :ride
# == Validations ==========================================================

# == Class Methods ========================================================


end
