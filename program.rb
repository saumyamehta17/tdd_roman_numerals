class Program

  MAP = {'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000}

  def call(input)
    return MAP[input] if MAP[input]

    result = 0
    roman_numbers = input.chars
    roman_numbers.each_with_index do |char, i|
      if MAP[char].nil?
        result = -1
        break
      end

      if roman_numbers[i+1] && MAP[roman_numbers[i+1]] && (MAP[roman_numbers[i+1]] > MAP[char])
        result -= MAP[char].to_i
      else
        result += MAP[char].to_i
      end
    end

    result < 0 ? "Invalid input" : result
  end

end