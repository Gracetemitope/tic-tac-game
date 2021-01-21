class Board
  attr_accessor :options, :options_checker
  def initialize (options, options_checker)
    @options = options
    @options_checker = options_checker
  end
  def update_board (symbol, option)
    updated = false
    if @options_checker.include?(option)
      @options_checker = @options_checker.reject {|choice| choice == option}
      @options[option] = symbol
      updated = true
    end
    updated
  end
end
