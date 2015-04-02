class Email
  def initialize(subject, header)
    @subject = subject
    @header = header
  end

  def subject
    @subject
  end

  def header
    @header
  end

  def date
    @header[:date]
  end

  def from
    @header[:from]
  end
end

class Mailbox
  def initialize(name, emails)
    @name = name
    @emails = emails
  end

  def name
    @name
  end

  def emails
    @emails
  end
end

class MailboxTextFormatter
  def initialize(mailbox)
    @mailbox = mailbox
    @sizes=[0, 0, 0]
  end

  def calcSize
    @mailbox.emails.collect do |email|
      if @sizes[0] < email.date.length
        @sizes[0] = email.date.length
      end
      if @sizes[1] < email.from.length
        @sizes[1] = email.from.length
      end
      if @sizes[2] < email.subject.length
        @sizes[2] = email.subject.length
      end
    end
    print
  end

  def drawSeparator
    @line = "+"
    1.upto(@sizes[0] + 2) {|a| @line << "-"}
    @line << "+"
    1.upto(@sizes[1] + 2) {|a| @line << "-"}
    @line << "+"
    1.upto(@sizes[2] + 2) {|a| @line << "-"}
    @line << "+"
    puts @line
  end

  def typeHeader
    @line = "| "
    @line << "Date".ljust(@sizes[0] + 1)
    @line << "| "
    @line << "From".ljust(@sizes[1] + 1)
    @line << "| "
    @line << "Subject".ljust(@sizes[2] + 1)
    @line << "|"
    puts @line
  end

  def typeData
    @mailbox.emails.collect do |email|
      @line = "| "
      @line << email.date.ljust(@sizes[0] + 1)
      @line << "| "
      @line << email.from.ljust(@sizes[1] + 1)
      @line << "| "
      @line << email.subject.ljust(@sizes[2] + 1)
      @line << "|"
      puts @line
    end
    print
  end

  def format
    puts
    puts @mailbox.name
    puts
    calcSize
    drawSeparator
    typeHeader
    drawSeparator
    typeData
    drawSeparator
  end
end

emails = [
    Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
    Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
    Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxTextFormatter.new(mailbox)

puts formatter.format