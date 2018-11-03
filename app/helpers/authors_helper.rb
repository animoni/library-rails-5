module AuthorsHelper
  
  def full_name
    #binding.pry 
    @author[:first_name] +" "+ @author[:last_name]
  end
  
  def full_name_index(first,last)
    "#{first} #{last}"
  end
end
