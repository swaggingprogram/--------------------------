require "json"

def question
  x = 0
  n = []
  m = []
  File.open("log.json") do |f|
    data = JSON.load(f)
    data.each do 
      puts "#{data[x]["time"]}, #{data[x]["address"]}, #{data[x]["result"]}"
      if data[x]["result"].include?("-")
        n << data[x]["address"]
        m << data[x + 1]["time"].to_i - data[x]["time"].to_i
      end
      x += 1
    end
    puts "故障状態のサーバーアドレスは#{n[0]}で、故障期間は#{m[0]}秒です"
  end
end

question


