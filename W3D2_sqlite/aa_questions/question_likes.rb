require_relative 'require_relative'

class QuestionLike

  def self.find_by_question_id(question_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, question_id: question_id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        question_id = :question_id
    SQL
    data.map { |datum| QuestionLike.new(datum) }
  end

  def self.likers_for_question_id(question_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, question_id: question_id)
      SELECT
        users.*
      FROM
        question_likes
      JOIN
        users ON users.id = question_likes.user_id
      WHERE
        question_likes.question_id = :question_id
    SQL
    data.map { |datum| User.new(datum) }
  end

  def self.likers_for_question_id(question_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, question_id: question_id)
      SELECT
        users.*
      FROM
        question_likes
      JOIN
        users ON users.id = question_likes.user_id
      WHERE
        question_likes.question_id = :question_id
    SQL
    data.map { |datum| User.new(datum) }
  end


  def self.num_likes_for_question_id(question_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, question_id: question_id)
      SELECT
        COUNT(*) AS num_likes
      FROM
        question_likes
      JOIN
        users ON users.id = question_likes.user_id
      WHERE
        question_likes.question_id = :question_id
    SQL
    data[0]['num_likes']
  end

  def self.liked_questions_for_user_id(user_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, user_id: user_id)
      SELECT
        questions.*
      FROM
        question_likes
      JOIN
        questions ON questions.id = question_likes.question_id
      WHERE
        question_likes.user_id = :user_id
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def self.most_liked_questions(n)
    data = QuestionsDBConnection.instance.execute(<<-SQL, num: n)
      SELECT
        questions.*, COUNT(*) AS likers
      FROM
        question_likes
      JOIN
        questions ON questions.id = question_likes.question_id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(*) DESC
      LIMIT
        :num
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def initialize(options)
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

end


if __FILE__ == $0
  # (1..5).each do |i| # question id
  #   p QuestionLike.likers_for_question_id(i)
  #   puts "Num like: #{QuestionLike.num_likes_for_question_id(i)}"
  #   puts
  # end
  # puts
  # (1..4).each do |i| # user id
  #   p QuestionLike.liked_questions_for_user_id(i)
  #   puts
  # end

  p  QuestionLike.most_liked_questions(3)
end
