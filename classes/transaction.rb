class Transaction

  attr_accessor :credit_account, :debit_account, :amount, :time

  def initialize(options = {})
    @credit_account = options[:credit_account] if valid_account_number? options[:credit_account]
    @debit_account = options[:debit_account] if valid_account_number? options[:debit_account]
    @amount = options[:amount] if valid_amount? options[:amount]
    @time = options[:time] if valid_time? options[:time]
  end

  ## validations

  def valid_account_number?(number)
    return true if number.class == Fixnum 
    raise ArgumentError, "Account number must be of type integer."
  end

  def valid_amount?(amount)
    return true if amount.class == Fixnum
    raise ArgumentError, "Amount must be of type integer. Please specify amount in cents."
  end

  def valid_time?(time)
    return true if time.class == Time
    raise ArgumentError, "Time must be of Time data type."
  end


  ## syntactic sugar

  def amount_to_currency
    "$#{(@amount.to_s.insert(-3, "."))}"
  end

  def pretty_time
    @time.strftime("%A, %d %b %Y %l:%M %p")
  end

end