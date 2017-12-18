module Enumerable
  def my_each
    for e in self
      yield(e)
    end
    self
  end

  def my_each_with_index
    i=0
    self.my_each do |e|
      yield(e, i)
      i += 1
    end
    self
  end

  def my_select
    selected_elements = {} if self.class == Hash
    selected_elements = [] if self.class == Array || self.class == Range

    if self.class == Array || self.class == Range
      self.my_each do |e|
        if yield(e) == true
          selected_elements.push(e)
        end
      end
    elsif self.class == Hash
          for key, value in self
            selected_elements[key] = value if (yield(key, value))
          end
    end

    return selected_elements
  end

  def my_all?
    correct = true
    self.my_each do |e|
      if yield(e) == false
        correct = false
      end
    end
    correct
  end

  def my_any?
    correct = false
    self.my_each do |e|
      if yield(e) == true
        correct = true
      end
    end
    correct
  end

  def my_none?
    correct = true
    self.my_each do |e|
      if yield(e) == true
        correct = false
      end
    end
    correct
  end

  def my_count
    count = 0
    self.my_each do |e|
      if block_given?
        count +=1 if yield(e) == true
      else
        count +=1
      end
    end
    count
  end

  def my_map(proc = nil)
    mapped_arr = []
    if proc && proc.class == Proc
      self.my_each do |e|
        mapped_arr.push(proc.call(e))
      end

    else
      self.my_each do |e|
        mapped_arr.push(yield(e))
      end
    end
    mapped_arr
  end

  def my_inject (val = self[0])
    val ||= []
    self.my_each do |e|
      val = yield(val, e)
    end
    val
  end

end
