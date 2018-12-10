require_relative 'require_relative'

class User < ModelBase

  def self.find_by_name(fname, lname)
    data = QuestionsDBConnection.instance.execute(<<-SQL, fname: fname, lname: lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = :fname AND lname = :lname
    SQL
    data.map { |datum| User.new(datum) }[0]
  end

  attr_accessor :fname, :lname

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def save
    return update unless id.nil?
    QuestionsDBConnection.instance.execute(<<-SQL, @fname, @lname)
      INSERT INTO
        users (fname, lname)
      VALUES
        (?, ?)
    SQL
    @id = QuestionsDBConnection.instance.last_insert_row_id
  end


  def authored_questions
    Question.find_by_author_id(id)
  end

  def authored_replies
    Reply.find_by_user_id(id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(id)
  end

  def average_karma
    data = QuestionsDBConnection.instance.execute(<<-SQL, user_id: id)
      SELECT
        users.id, AVG(COALESCE(num_likes, 0)) AS average
      FROM
        users
      LEFT JOIN
        questions ON questions.author_id = users.id
      LEFT JOIN
        (SELECT question_id, COUNT(*) AS num_likes
        FROM question_likes
        GROUP BY question_likes.question_id) AS count_likes
        ON count_likes.question_id = questions.id
      WHERE
        users.id = :user_id
      GROUP BY
        users.id
    SQL
    data[0]['average']
  end

  private
  attr_reader :id

  def update
    QuestionsDBConnection.instance.execute(<<-SQL, @fname, @lname, @id)
      UPDATE
        users
      SET
        fname = ?, lname = ?
      WHERE
        id = ?
    SQL
    nil
  end

end


if __FILE__ == $0
  (1..4).each do |i|
    user = User.find_by_id(i)
    puts "Average karma for #{user.fname}: #{user.average_karma}"
  end

end
