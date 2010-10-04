module FormTestMacros

  def it_must_create_an_input_of_type(type)
    it "must create an input of type #{type}" do
      assert_select_in(subject.to_s, "input[type=#{type}]")
    end
  end

  def it_must_create_an_input_with_name(name)
    it "must create an input with name #{name}" do
      assert_select_in(subject.to_s, "input[name=#{name}]")
    end
  end

  def it_must_set_the_value_to(value)
    it "must set the value to #{value}" do
      assert_select_in(subject.to_s, "input[value=#{value}]")
    end
  end

  def it_must_set_the_min_to(minimum)
    it "must set min to #{minimum}" do
      assert_select_in(subject.to_s, "input[min=#{minimum}]")
    end
  end

  def it_must_set_the_max_to(maximum)
    it "must set max to #{maximum}" do
      assert_select_in(subject.to_s, "input[max=#{maximum}]")
    end
  end

end
