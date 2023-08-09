module ExpenseTracker 
  def initialize
    @addexpense=[]
  end
  
  
  def add_expense
    amount=input_validation("Enter the amount : ", /\A\d+(\.\d+)?$/, "Invalide amount\n\n")
    return if amount.nil?
    
    category=input_validation("Enter the category : ", /^[A-Za-z\s]+$/, "Invalide category\n\n")
    return if category.nil?
    
    date=input_validation("Enter the date : ", /\A\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])\z/, "Invalide date\n\n")
    return if date.nil?
    
    expenses=Expense.new(amount.to_f,category,date)
    @addexpense << expenses
    puts "\nExpense added successfully!\n\n"
  end
  
  
  def view_expense(expense_list=@addexpense)
    check_expense_is_empty(expense_list)

    puts "%-15s %-15s %-15s" % ["Amount", "Category", "Date"]
    puts "---------------------------------------------------"
    
    expense_list.each do|expense|
      puts "%-15s %-15s %-15s" % [expense.amount, expense.category, expense.date]
    end
    total_expense
    puts "---------------------------------------------------"
  end
  
  
  def total_expense
    total_amount=0
    index=0
    while index < @addexpense.length
      total_amount+=@addexpense[index].amount
      index +=1
    end
    puts "\nTotal Expense is : #{total_amount}"
  end
  
  
  def filter_expense
    check_expense_is_empty(@addexpense)

    category=input_validation("Enter the category : ",/^[A-Za-z\s]+$/,"Invalide category\n\n")
    return if category.nil?
    
    result=@addexpense.select{|expense|expense.category.downcase==category.downcase}
    puts "\nFiltered Expenses is :"
    return view_expense(result)
  end
  
  
  def delete_expense
    check_expense_is_empty(@addexpense)

    print "Enter the index to delete expense list: "
    index=valid_index

    deleted_item= @addexpense.delete_at(index.to_i-1)
    
    puts "\nExpense deleted successfully"
    puts "deleted expense is: Amount : #{deleted_item.amount}   "+
    "Category : #{deleted_item.category}     Date : #{deleted_item.date}\n\n"
  end
  
  
  def valid_index
    count=0
    index=gets.chomp
    while index.to_i <=0 || index.to_i > @addexpense.length || !/\A\d+\z/.match(index)
      count+=1
      if count==3
        puts "\nMultiple times invalid input"
        start_main()
      end
      print "Invalid index try again Enter index: "
      index=gets.chomp
    end
    return index
  end
end



