require_relative 'require_relative'

class Question < ModelBase

  def self.find_by_author_id(author_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, author_id: author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = :author_id
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  attr_reader :id, :title, :body, :author_id

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def save
    self.update if @id
    QuestionsDBConnection.instance.execute(<<-SQL, @title, @body, @author_id)
      INSERT INTO
        questions (title, body, author_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = QuestionsDBConnection.instance.last_insert_row_id
  end

  def update
    self.save unless @id
    QuestionsDBConnection.instance.execute(<<-SQL, @title, @body, @author_id, @id)
      UPDATE
        questions
      SET
        title = ?, body = ?, author_id = ?
      WHERE
        id = ?
    SQL
  end

  def author
    User.find_by_id(author_id)
  end

  def replies
    Reply.find_by_question_id(id)
  end

  def followers
    QuestionFollow.followers_for_question_id(id)
  end

  def likers
    QuestionLike.likers_for_question_id(id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(id)
  end

end


if __FILE__ == $0

  (1..5).each do |i|
    q = Question.find_by_id(i)
    p q.followers
    puts "\n\n"
  end

end
