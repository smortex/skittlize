require 'digest'

class Array
  def skittlize
    map do |cell|
      case cell
      when Array
        cell.skittlize
      when String
        cell.skittlize
      else
        cell
      end
    end
  end

  def skittlize!
    replace(skittlize)
  end
end

class String
  def skittlize
    n = Integer(Digest::MD5.hexdigest("#{self}\n")[-2..-1], 16)
    n %= 231
    n += 17 if [0, 15, 16].include?(n)

    "\033[38;5;#{n}m#{self}\033[0m"
  end

  def skittlize!
    replace(skittlize)
  end
end
