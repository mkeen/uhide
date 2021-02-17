‼️🔑 = 'invalid key'.colorize(:magenta)
‼️👾 = 'unsupported'.colorize(:magenta) + ' 👾'

class Uhide::Main
  @@☔ = " ☔ > "
  @@🔑 = " 🔑 > "
  @@🗄️ = {}
  
  class << self
    def 🧂
      🗃️ '🧂', SecureRandom.random_bytes
    end
    
    def 📏
      🗃️ '📏', ActiveSupport::MessageEncryptor.key_len
    end
    
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
      @@✍️ = ✍️ if simple
      🚽
      return ✍️
    end
    
    def 🔓 🏷️: nil
      if 🏷️.nil?
        puts @@🗄️['〽️']
      else
        puts @@🗄️['〽️'][🏷️]
      end
      
    end
    
    def 🔒 🏷️, 💎
      @@🗄️['〽️'][🏷️] = 💎
      💾
    end
    
    def 💾
      ⚛️ = ActiveSupport::MessageEncryptor.new(
        ActiveSupport::KeyGenerator.new(@@✍️).generate_key(🧂, 📏)  
      )
      
      🥾 = !(not @@🗄️['〽️'])
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
      if @@🗄️[🗂️]
        return @@🗄️[🗂️]
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
            puts ‼️🔑
            exit!
          end
          
        else
          📖 = 📕
        end
        
      end
      
      return @@🗄️[🗂️] = 📖
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
        if ❓(@@🔑, simple: false) == @@✍️
          ['〽️', '🧂', '📏'].each_entry { |item| File.delete "./#{item}" }
          exit!
        else
          puts ‼️🔑
        end
        
      else
        puts ‼️👾
      end
      
    end
    
    def ✈️
      begin
        ❓ @@🔑
        
        💾
        
        loop do
          print @@☔
          🤖(🧼 gets)
        end
        
      rescue SystemExit, Interrupt
        🚽
        exit!
      end
      
    end
    
  end
  
end
