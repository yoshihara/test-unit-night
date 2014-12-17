class User
  attr_accessor :locale
  attr_accessor :last_name, :first_name

  def initialize(locale="ja")
    @last_name = "Yamada"
    @first_name = "Taro"
    @locale = locale
  end

  def full_name
    if ja?
      "#{@last_name} #{@first_name}"
    else
      "#{@first_name} #{@last_name}"
    end
  end

  def ja?
    locale == "ja"
  end
end
