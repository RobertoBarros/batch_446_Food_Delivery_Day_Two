class SessionsView
  def ask_username
    puts "Username?"
    gets.chomp
  end

  def ask_password
    puts "Password?"
    gets.chomp
  end

  def wrong_credentials
    puts "Wrong Credentials... try again"
  end

  def correct_credentials(username)
    puts "Welcome #{username}"
  end
end
