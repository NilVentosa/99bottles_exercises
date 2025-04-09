class Bottles
  def verse(number)
    bottle_number = BottleNumber.new(number)

    "#{bottle_number.quantity.capitalize} #{bottle_number.container} of beer on the wall, " \
    "#{bottle_number.quantity} #{bottle_number.container} of beer.\n" \
    "#{bottle_number.action}, " \
    "#{bottle_number.successor.quantity} #{bottle_number.successor.container} of beer on the wall.\n"
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
      "Go to the store and buy some more"
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
