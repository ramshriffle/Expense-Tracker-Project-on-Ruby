require_relative "expense_tracker"
require_relative 'expense'
require_relative "check_input"
require_relative "edit_expense" 

class Main
  include CheckInput
  include ExpenseTracker
  include EditExpense

  def start_main
    loop do
      count=0
      puts "EXPENSE-TRACKER"
      puts "1 : Add Expense"
      puts "2 : View Expenses"
      puts "3 : Filter Expenses"
      puts "4 : Edit Expense"
      puts "5 : Delete Expense"
      puts "6 : Exit"
      puts "________________________________________________________"    

      choice=input_validation("Please enter the choice : ", /\A[1-6]\z/, "Invalide choice\n\n")
      return if choice.nil?

      case choice.to_i
      when 1
          add_expense
      when 2
          view_expense       
      when 3
          filter_expense
      when 4
          edit_expenses
      when 5
          delete_expense
      when 6
          puts "Thank you"
          puts "Exit"
          exit
      end
    end
  end
end
start_expense_tracking=Main.new
start_expense_tracking.start_main
