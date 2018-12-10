require_relative 'require_relative'

class QuestionFollow

  def self.find_by_question_id(question_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, question_id: question_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        question_id = :question_id
    SQL
    data.map { |datum| QuestionFollow.new(datum) }
  end

  def self.followers_for_question_id(question_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, question_id: question_id)
      SELECT
        users.*
      FROM
        question_follows
      JOIN
        users ON users.id = question_follows.user_id
      WHERE
        question_follows.question_id = :question_id
    SQL
    data.map { |datum| User.new(datum) }
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, user_id: user_id)
      SELECT
        questions.*
      FROM
        question_follows
      JOIN
        questions ON questions.id = question_follows.question_id
      WHERE
        question_follows.user_id = :user_id
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def self.most_followed_questions(n)
    data = QuestionsDBConnection.instance.execute(<<-SQL, num: n)
      SELECT
        questions.*, COUNT(*) AS followers
      FROM
        question_follows
      JOIN
        questions ON questions.id = question_follows.question_id
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
  # (1..4).each do |i|
  #   p QuestionFollow.followed_questions_for_user_id(i)
  # end
  #
  # (1..5).each do |i|
  #   p QuestionFollow.followers_for_question_id(i)
  # end

  p QuestionFollow.most_followed_questions(3)

end
