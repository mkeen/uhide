require 'rubygems'
require 'bundler/setup'
require 'yaml'
require 'io/console'
require 'securerandom'

Bundler.require(:default)


☔ = " ☔ > "
$🔑 = " 🔑 > "
$🧂 = (lambda { 🗃️ '🧂', SecureRandom.random_bytes })
$📏 = lambda { 🗃️ '📏', ActiveSupport::MessageEncryptor.key_len }
INVALID_KEY = 'invalid key'.colorize(:red)
$cache = {}

def password?
  🧼 STDIN.noecho(&:gets)
end

def 🚽
  print "\r"
  $stdout.flush
end

def ❓ 🔑, simple: true
  print 🔑
  password = password?
  $password = password if simple
  🚽
  return password
end

def 🧼 🗑️
  🗑️.chomp
end

def 🔓 🏷️: nil
  if 🏷️.nil?
    puts $cache['ddllv']
  else
    puts $cache['ddllv'][🏷️]
  end
  
  📕 = File.read './🧂'
  if 📕.empty?
    🔀 = SecureRandom.random_bytes $📏.call
    File.write './🧂', Marshal.dump(🔀)
    return $cache['🧂'] = 🔀
  else
    return $cache['🧂'] = Marshal.load(File.read './🧂')
  end
  
end

def 🔒 🏷️, 💎
  $cache['ddllv'][🏷️] = 💎
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
    
  when :reset
    if ❓($🔑, simple: false) == $password
      ['ddllv', '🧂', '📏'].each_entry{ |item| File.delete "./#{item}" }
      exit!
    else
      puts INVALID_KEY
    end
    
  end
  
end

def 💾
  ⚛️ = ActiveSupport::MessageEncryptor.new(
    ActiveSupport::KeyGenerator.new($password).generate_key($🧂.call, $📏.call)  
  )
  
  was_bootstrapped = !(not $cache['ddllv'])
  📖 = 🗃️ 'ddllv', {}, ⚛️: ⚛️
  📀 'ddllv', 📖, ⚛️: ⚛️ if was_bootstrapped
end

def 📀 🗂️, 📖, ⚛️: false
  if ⚛️
    📕 = ⚛️.encrypt_and_sign 📖
  else
    📕 = 📖
  end
  
  📕 = Marshal.dump(📕) 
  File.write "./#{🗂️}", 📕
  return 📕
end

def 🗃️ 🗂️, 🔀, ⚛️: false
  if $cache[🗂️]
    return $cache[🗂️]
  end
  
  begin
    📕 = File.read "./#{🗂️}"
  rescue Errno::ENOENT
    📕 = 📀 🗂️, 🔀, ⚛️: ⚛️
  end
  
  if not 📕.empty?
    📕 = Marshal.load 📕
    
    if ⚛️
      begin
        📖 = ⚛️.decrypt_and_verify 📕
      rescue ActiveSupport::MessageVerifier::InvalidSignature
        puts INVALID_KEY
        exit!
      end
      
    else
      📖 = 📕
    end
    
  end
  
  return $cache[🗂️] = 📖
end

begin
  ❓ $🔑
  
  💾
  
  loop do
    print ☔
    🤖(🧼 gets)
  end
  
rescue SystemExit, Interrupt
  🚽
  exit!
end
