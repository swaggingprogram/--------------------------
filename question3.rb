require "json"

def question3
  x = 0
  y = -1
  a = 0
  puts "直近の回数(m)を入力してください"
  m = gets.to_i
  puts "過負荷状態と認定できるミリ秒(t)を入力してください"
  t = gets.to_i
  puts "直近の回数(#{m}回), 過負荷状態と認定できるミリ秒(#{t}ミリ秒)"
  File.open("log.json") do |f|
    data = JSON.load(f)
    puts "直近#{m}回のサーバーの監視ログ"
    data.each do
      puts "#{data[y]["time"]}, #{data[y]["address"]}, #{data[y]["result"]}"
      a += data[y]["result"].to_i
      y -= 1
      if y == -(m)
        break
      end
    end
    b = a / m
    puts "直近#{m}回の応答時間の平均は#{b}ミリ秒です。"
    if b >= t
      puts "設定した規定のミリ秒を超えています。サーバーは過負荷状態です"
    else
      puts "サーバーは正常です。"
    end
  end
end

question3