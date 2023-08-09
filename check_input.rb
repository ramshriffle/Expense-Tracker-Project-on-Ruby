module CheckInput 

  def input_validation(prompt,regex,error_message)
    3.times do|attempt|
      print prompt
      input=gets.chomp.strip
      
      if input =~regex
        return input
      end   
        puts error_message
    end
    puts "Multiple times invalid input\n\n"
    return nil
  end


  def get_valid_input(prompt,regex,error_message)
    3.times do|attempt|
      print prompt
      input=gets.chomp.strip

      if input.empty? 
        return 
      elsif regex.match(input)
        return input
      end
      puts error_message
    end
    puts "Multiple times invalid input\n\n"
    return nil
  end


  #this method used to check there is value in @addexpense array or not
  def check_expense_is_empty(expense)
    if expense.empty?
      puts "No expense record available\n\n"
      start_main
    end
  end
end
