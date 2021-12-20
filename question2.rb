require "json"

def question2
  x = 0
  y = 0
  count = 0
  puts "1から10までの数字でタイムアウトの回数を入力してください"
  z = gets.to_i
  puts "故障と認定するタイムアウトの回数(N)を入力してください"
  a = gets.to_i
  puts "追加されたタイムアウトの数(#{z}回), 故障と認定されるタイムアウトの回数(#{a}回)"
  File.open("log.json") do |f|
    data = JSON.load(f)
    z.times do
      data[y]["result"] = "-"
      y += 1
    end
    data.each do
      puts "#{data[x]["time"]}, #{data[x]["address"]}, #{data[x]["result"]}"
      if data[x]["result"].include?("-")
        count += 1
      end
      x += 1
    end
  end
  if count >= a
    return puts "タイムアウトが規定の数(#{a})を超えました。エラーと認定します。"
  else
    return puts "タイムアウトが規定の数(#{a})を超えませんでした"
  end
end

question2


