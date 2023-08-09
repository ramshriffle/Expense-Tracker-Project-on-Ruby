module EditExpense
  
  def edit_expenses
    check_expense_is_empty(@addexpense)

    print "Enter the index to edit expense list: "
    index=valid_index.to_i-1   

    amount=get_valid_input("Enter the amount(Optional) : ",/\A\d+(\.\d+)?$/,"invalid amount\n\n")
    @addexpense[index].amount=amount.to_f unless amount.nil?
  
    category=get_valid_input("Enter the category(Optional) : ",/^[A-Za-z\s]+$/,"invalid category\n\n")
    @addexpense[index].category=category unless category.nil?

    date=get_valid_input("Enter the date(Optional) : ", /\A\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])\z/,"invalid date\n\n")
    @addexpense[index].date=date unless date.nil?

    puts "\nExpense edited successfully"
    puts "Edit expense is: Amount : #{@addexpense[index].amount}   "+
         "Category : #{@addexpense[index].category}   Date : #{@addexpense[index].date}\n\n"
  end
end
