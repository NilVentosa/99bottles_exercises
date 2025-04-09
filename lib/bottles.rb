class Bottles
  def verse(number)
    bottle_number = BottleNumber.new(number)

    "#{bottle_number} of beer on the wall, ".capitalize +
      "#{bottle_number} of beer.\n" \
      "#{bottle_number.action}, " \
      "#{bottle_number.successor} of beer on the wall.\n"
  end

  def verses(high, low)
    high.downto(low).map { |number| verse number }.join("\n")
  end

  def song
    verses(99, 0)
  end
end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end

  def container
    if number == 1
      'bottle'
    else
      'bottles'
    end
  end

  def pronoun
    if number == 1
      'it'
    else
      'one'
    end
  end

  def quantity
    if number.zero?
      'no more'
    else
      number.to_s
    end
  end

  def action
    if number.zero?
      'Go to the store and buy some more'
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def successor
    if number.zero?
      BottleNumber.new(99)
    else
      BottleNumber.new(number - 1)
    end
  end
end
