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
end

email = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Ferdous" })

puts "Date:    #{email.header[:date]}"
puts "From:    #{email.header[:from]}"
puts "Subject: #{email.subject}"