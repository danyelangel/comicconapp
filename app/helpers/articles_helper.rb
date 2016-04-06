module ArticlesHelper
  def cut_long_text(str)
    if str.size > 150
      text = str[0..150]
    else
      text = str
    end
    return "#{text}..."
  end
end
