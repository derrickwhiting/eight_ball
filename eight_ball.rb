

# Basic Objectives:
# - User inputs question

class Eight_ball
  
  ANSWERS = ["It is certain", "It is decidedly so", "Without a doubt", "Yes, definitely", "You may rely on it", "As I see it", "Outlook good", "Yes", "Signs point to yes", "Reply hazy try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful"]

  def initialize
    @answers = ANSWERS
  end

  def main_menu
    puts `clear`
    puts 'Magic eight ball'
    puts ''
    puts "Let's do this thing!!!!!!  Ask me anything and I'll let you know what's up."
  end

  def user_input
    puts ''
    puts "Please type your question below"
    question = gets.strip

    case question
      when "print_answers"
        print_answers
      when "add_answers"
        add_answer
      when "reset_answers"
        reset_answers
      end
  end

  def shake
    puts ''
    puts @answers.sample
    puts ''
  end

  def exit_game
    puts 'Do you want to ask another? (y/n)'
    another = gets.strip.downcase
    if another == 'n'
      puts `clear`
      puts "This game is for entertainment purposes only . . . developer shall not be liable to the Owner for any special or consequential damages, including but not limited to, lost profits, loss of use, and costs of replacement, caused by the Design Professional's negligence, breach of contract, or any other cause whatsoever"
      puts ''
      exit(0)
    end
  end

  def print_answers
    @answers.each do |ans|
      puts ans
    end
  end

  def reset_answers
    @answers = ANSWERS
    puts 'Answers have been reset . . . press any key to continue'
    gets
    exit_game
  end

  def add_answer
    puts 'Please type your answer'
    add_answer_response = gets.strip.capitalize
    if @answers.include?(add_answer_response)
      puts "I've already got that one"
      add_answer
    end
    @answers << add_answer_response
    puts "#{add_answer_response} has been added"
    puts 'Add another? (y/n)'
    if gets.strip.downcase == 'y'
      add_answer
    else
      exit_game
    end
  end
end

first_arg = ARGV[0]
ARGV.clear

eight_ball = Eight_ball.new

while true
  eight_ball.main_menu
  eight_ball.user_input
  eight_ball.shake
  eight_ball.exit_game
end

# - Computer outputs random answer
# - User inputs "QUIT"
# - Computer outputs a goodbye message and exits

# Bonus Objectives:
# - ability to add more answers:
#   - via easter egg question ("add_answers")
#   - via script arguments (ruby magic_eight.rb add_answers)
#   - do not let them add the same answer if the eight ball already has that answer

# - ability to reset answers back to original bank (hint: think constants)
#   - via easter egg question ("reset_answers")

# - ability to have eight ball print all answers
#   - via easter egg question ("print_answers"