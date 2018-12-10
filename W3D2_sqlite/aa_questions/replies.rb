require_relative 'require_relative'

class Reply < ModelBase

  def self.find_by_user_id(user_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, user_id: user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = :user_id
    SQL
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, question_id: question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = :question_id
    SQL
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_child_replies(reply_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, reply_id: reply_id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply_id = :reply_id
    SQL
    data.map { |datum| Reply.new(datum) }
  end

  attr_reader :id, :question_id, :parent_reply_id, :user_id, :body

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_reply_id = options['parent_reply_id']
    @user_id = options['user_id']
    @body = options['body']
  end

  def save
    self.update if @id
    QuestionsDBConnection.instance.execute(<<-SQL, @question_id, @parent_reply_id, @user_id, @body)
      INSERT INTO
        replies (question_id, parent_reply_id, user_id, body)
      VALUES
        (?, ?, ?, ?)
    SQL
    @id = QuestionsDBConnection.instance.last_insert_row_id
  end

  def update
    self.save unless @id
    QuestionsDBConnection.instance.execute(<<-SQL, @question_id, @parent_reply_id, @user_id, @body, @id)
      UPDATE
        replies
      SET
        question_id = ?, parent_reply_id = ?, user_id = ?, body = ?
      WHERE
        id = ?
    SQL
  end

  def author
    User.find_by_id(user_id)
  end

  def question
    Question.find_by_id(question_id)
  end

  def parent_reply
    Reply.find_by_id(parent_reply_id)
  end

  def child_replies
    Reply.find_child_replies(id)
  end


end


if __FILE__ == $0
  (1..8).each do |i|
    r = Reply.find_by_id(i)
    p r.author
    p r.question
    p r.parent_reply
    p r.child_replies
    puts "\n\n\n"
  end
end
