require 'io/console'
require 'securerandom'
require 'active_support'
require 'colorize'
require 'yaml'

☔ = " ☔ > "
🔑 = " 🔑 > "

INVALID_KEY = 'invalid key'.colorize(:red)

$cached_🧂 = nil
$cached_📏 = nil

def password?
  🧼 STDIN.noecho(&:gets).chomp
end

def 🚽
  print "\r"
  $stdout.flush
end

def ❓ 🔑
  print 🔑
  $password = password?
  🚽
end

def 🧼 🗑️
  🗑️.chomp
end

def 🔓 🏷️: nil
  if 🏷️.nil?
    puts $index
  else
    puts $index[🏷️]
  end
  
  📕 = File.read './🧂'
  if 📕.empty?
    🔀 = SecureRandom.random_bytes 📏
    File.write './🧂', Marshal.dump(🔀)
    return $cached_🧂 = 🔀
  else
    return $cached_🧂 = Marshal.load(File.read './🧂')
  end
  
end

def 🔒 🏷️, 💎
  $index[🏷️] = 💎
  💾
end

def 🤖 🗣️
  👾, 🏷️, 💎 = 🗣️.split
  
  case 👾.to_sym
  when :get
    if 🏷️
      🔓 🏷️: 🏷️
    else
      🔓
    end
    
  when :set
    🔒 🏷️, 💎
    
  when :setup
    🚽
    password = password?
    🚽
    if password == $password
      File.write './ddllv', ''
      File.write './🧂', ''
      exit!
    else
      puts INVALID_KEY
    end
    
  end
  
end

def 💾
  ⚛️ = ActiveSupport::MessageEncryptor.new(
    ActiveSupport::KeyGenerator.new($password).generate_key(🧂, 📏)  
  )
  
  unless $index
    📕 = File.read './ddllv'
    unless 📕.empty?
      begin
        📕 = Marshal.load(📕)
        📖 = ⚛️.decrypt_and_verify(📕)
      rescue ActiveSupport::MessageVerifier::InvalidSignature
        puts INVALID_KEY
        exit!
      end
      
      return YAML.load 📖
    end
    
    return {}
    
  else
    📕 = ⚛️.encrypt_and_sign($index.to_yaml)  
    File.write './ddllv', Marshal.dump(📕)
    return $index.to_yaml
  end
  
end

def 🧂
  if $cached_🧂
    return $cached_🧂
  end
  
  📕 = File.read './🧂'
  if 📕.empty?
    🔀 = SecureRandom.random_bytes 📏
    File.write './🧂', Marshal.dump(🔀)
    return $cached_🧂 = 🔀
  else
    return $cached_🧂 = Marshal.load(File.read './🧂')
  end
  
end

def 📏
  if $cached_📏
    return $cached_📏
  end
  
  📕 = File.read './📏'
  if 📕.empty?
    🔀 = ActiveSupport::MessageEncryptor.key_len
    File.write './📏', Marshal.dump(🔀)
    return $cached_📏 = 🔀
  else
    return $cached_📏 = Marshal.load(File.read './📏')
  end
  
end

begin
  ❓ 🔑
  
  $index = 💾
  
  loop do
    print ☔
    🤖(🧼 gets)
  end
  
rescue SystemExit, Interrupt
  🚽
  exit!
end
