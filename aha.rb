# # USER STORY #
# gets name challenge topic date(now) body
# enter and lists the whole database with yours on top
# nice printed format
# # SUDO #
# what classes do we have? printer, aha, aha_heaven, controller?
# properties? aha => name,topic,challenge,date, body
#             aha_heaven => array_of_aha
#             printer =>
#             controller =>
# method?
require 'csv'

class Aha
  def initialize(args = {})
    @name = args[:name]
    @topic = args[:topic]
    @challenge = args[:challenge]
    @date = args[:date]
    @body = args[:body]
  end
end

class AhaHeaven
  attr_accessor :list
  def initialize
    @list = []
  end

  def unshift_aha(aha)
    @list.unshift(aha)
  end
end

class Printer
  def initialize

  end
end

class Controller
  def initialize
    databse = CSV.table("database.csv")
    @heaven = AhaHeaven.new

    self.feed_heaven
    self.add_aha
    p @heaven.list
  end

  def feed_heaven
    database.each do |row|
       @heaven.list << Aha.new(row)
    end
  end

  def add_aha
    name = gets.chomp
    topic = gets.chomp
    challenge = gets.chomp
    date = Time.now.strftime("%d/%m/%y")
    body = gets.chomp

    @heaven.unshift_aha(Aha.new(name: name, topic: topic, challenge: challenge, date: date, body: body))
  end

  def backup_heaven
    @heaven.each do |aha|
      CSV.open("database.csv", "wb") do |csv|
        csv <<
        end
      end
    end
  end
end


Controller.new