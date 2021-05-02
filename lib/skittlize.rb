require 'digest'

class Array
  def skittlize(options = {})
    map do |cell|
      case cell
      when Array, String
        cell.skittlize(options)
      else
        cell
      end
    end
  end

  def skittlize!(options = {})
    replace(skittlize(options))
  end
end

class String
  def skittle_color
    n = Integer(Digest::MD5.hexdigest("#{self}\n")[-2..-1], 16)
    n %= 231
    n += 17 if [0, 15, 16].include?(n)
    n
  end

  def skittlize(options = {})
    check_options(options)

    if options[:split]
      split(options[:split]).map(&:skittlize).join(options[:join] || options[:split])
    else
      "\033[38;5;#{skittle_color}m#{self}\033[0m"
    end
  end

  def skittlize!(options = {})
    replace(skittlize(options))
  end

  private

  def check_options(options)
    extra_options = options.keys - [:split, :join]

    raise "Unsupported options: #{extra_options}" if extra_options.any?
  end
end
