class Payment < ActiveRecord::Base
  belongs_to :loan
  
  # validates :amount, presence: true
  validate :amount_is_less

  def amount_is_less
    if (loan.remaining_amount <= amount)
      errors.add(:amount, "Amount can not be less then outstanding balance.")
    end
  end
end
