class Loan < ActiveRecord::Base
    has_many :payments

    def remaining_amount
        funded_amount - payments.pluck(:amount).inject(0){|sum,x| sum + x }
    end
end
