class Uhide::Main
  @@☔ = " ☔ > "
  @@🔑 = " 🔑 > "
  @@🗄️ = {}
  
  class << self
    def ‼️ ❗; ❗.colorize :magenta; end
    def 🧂; 🗃️ '🧂', SecureRandom.random_bytes; end
    
    def 🚽
      print "\r"
      $stdout.flush
    end
    
    def 🧼 🗑️
      🗑️.chomp
    end
    
    def ❓ 🔑, 😐: true
      print 🔑
      ✍️ = 🧼 STDIN.noecho(&:gets)
      @@✍️ = ✍️ if 😐
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
        ActiveSupport::KeyGenerator.new(@@✍️).generate_key 🧂, ActiveSupport::MessageEncryptor.key_len
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
            puts ‼️ 🔑
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
        
      else
        puts ‼️('unsupported') + ' 👾'
      end
      
    end
    
    def ✈️
      begin
        ❓ @@🔑
        
        💾
        
        loop do
          print @@☔
          🤖 🧼 gets
        end
        
      rescue SystemExit, Interrupt
        🚽
        exit!
      end
      
    end
    
  end
  
end

Uhide::Main.✈️