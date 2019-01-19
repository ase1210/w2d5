class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    num_to_hash = 1
    self.each_with_index do |el, i|
      num_to_hash += (el + 1) * (i + 1)
    end
    num_to_hash.hash
  end
end

class String

  def hash
    num_to_hash = 1
    self.chars.each_with_index do |el, i|
      num_to_hash += (el.ord + 1) * (i + 1)
    end
    num_to_hash.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    num_to_hash = 1
    keys = self.sort_by { |k, v| k }.to_a.flatten
    # values = self.values

    keys.each_with_index do |el, i|
      if el.is_a?(Symbol)
        num_to_hash += (el.to_s.ord + 1) * (i + 1)
      elsif el.is_a?(String)
        el.hash
      else
        num_to_hash += (el + 1) * (i + 1)
      end
    end

  #   values.each_with_index do |el, i|
  #     if el.is_a?(Symbol)
  #       num_to_hash += (el.to_s.ord + 1) * (i + 1)
  #     elsif el.is_a?(String)
  #       el.hash
  #     else
  #       num_to_hash += (el + 1) * (i + 1)
  #     end
  #   end
    num_to_hash.hash
  end
end

