INVALID_🔑 = 'invalid key'.colorize(:magenta)
UNSUPPORTED_👾 = 'unsupported'.colorize(:magenta) + ' 👾'

$☔ = " ☔ > "
$🔑 = " 🔑 > "
$🧂 = -> { 🗃️ '🧂', SecureRandom.random_bytes }
$📏 = -> { 🗃️ '📏', ActiveSupport::MessageEncryptor.key_len }
$🗄️ = {}

def 🚽
  print "\r"
  $stdout.flush
end

def 🧼 🗑️
  🗑️.chomp
end

def ❓ 🔑, simple: true
  print 🔑
  ✍️ = 🧼 STDIN.noecho(&:gets)
  $✍️ = ✍️ if simple
  🚽
  return ✍️
end

def 🔓 🏷️: nil
  if 🏷️.nil?
    puts $🗄️['〽️']
  else
    puts $🗄️['〽️'][🏷️]
  end
  
end

def 🔒 🏷️, 💎
  $🗄️['〽️'][🏷️] = 💎
  💾
end

def 💾
  ⚛️ = ActiveSupport::MessageEncryptor.new(
    ActiveSupport::KeyGenerator.new($✍️).generate_key($🧂.call, $📏.call)  
  )
  
  🥾 = !(not $🗄️['〽️'])
  📖 = 🗃️ '〽️', {}, ⚛️: ⚛️
  📀 '〽️', 📖, ⚛️: ⚛️ if 🥾
end

def 📀 🗂️, 📖, ⚛️: false
  if ⚛️
    📕 = ⚛️.encrypt_and_sign 📖
  else
    📕 = 📖
  end
  
  📕 = Marshal.dump 📕
  File.write "./#{🗂️}", 📕
  return 📕
end

def 🗃️ 🗂️, 💎, ⚛️: false
  if $🗄️[🗂️]
    return $🗄️[🗂️]
  end
  
  begin
    📕 = File.read "./#{🗂️}"
  rescue Errno::ENOENT
    📕 = 📀 🗂️, 💎, ⚛️: ⚛️
  end
  
  if not 📕.empty?
    📕 = Marshal.load 📕
    
    if ⚛️
      begin
        📖 = ⚛️.decrypt_and_verify 📕
      rescue ActiveSupport::MessageVerifier::InvalidSignature
        puts INVALID_🔑
        exit!
      end
      
    else
      📖 = 📕
    end
    
  end
  
  return $🗄️[🗂️] = 📖
end

def 🤖 🗣️
  👾, 🏷️, 💎 = 🗣️.split
  
  if 👾.nil?
    return
  end
  
  case 👾.to_sym
  when :get
    if 🏷️
      🔓 🏷️: 🏷️
    else
      🔓
    end
    
  when :set
    🔒 🏷️, 💎
    
  when :exit, :quit
    exit!
    
  when :help
    puts "For help, quit and run `uhide -h` from your shell"
    
  when :reset
    if ❓($🔑, simple: false) == $✍️
      ['〽️', '🧂', '📏'].each_entry { |item| File.delete "./#{item}" }
      exit!
    else
      puts INVALID_🔑
    end
    
  else
    puts UNSUPPORTED_👾
  end
  
end

class Uhide::Main
  class << self
    def start()
      begin
        ❓ $🔑
        
        💾
        
        loop do
          print $☔
          🤖(🧼 gets)
        end
        
      rescue SystemExit, Interrupt
        🚽
        exit!
      end
      
    end
    
  end
  
end

