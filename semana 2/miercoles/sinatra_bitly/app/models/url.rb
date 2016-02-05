class Url < ActiveRecord::Base
  # Remember to create a migration!
  def self.make_short()
    chars = ('a'..'z').to_a.join + ('A'..'Z').to_a.join + ('0'..'9').to_a.join
    while true do
      result = ''
      7.times do
        result = result + chars[rand(chars.length)]
      end
      if (Url.find_by(short_url: result))
        next
      end
      return result
    end
  end
end
