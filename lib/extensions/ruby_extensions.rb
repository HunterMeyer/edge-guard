class String
  def smart_constantize
    singularize.capitalize.constantize
  end
end

class Symbol
  def smart_constantize
    to_s.smart_constantize
  end
end
