x = ARGV[0]
y = ARGV[1]
xx = ARGV[2]
yy = ARGV[3]

case
  when  x == xx && y == yy
    puts "Точка найдена!"
  when x != xx && y == yy
    puts "Y координата верна, X - нет"
  when x == xx && y != yy
    puts "X координата верна, Y - нет"
  else
    puts "Близко, но нет"
end
