require 'pg'

puts "before connect"

conn = PG.connect(
        :dbname => 'thangnpd_test',
        :user => 'postgres',
        :password => '123456')

puts "after connect"

conn.exec( "SELECT * FROM articles" ) do |result|
  result.each do |row|
    puts "Title of article #{row['id']} is #{row['title']}"
   	file = File.open("/home/local/ELARION/thangnpd/Desktop/#{row['title']}.txt", "w") do |f| 
	  f.write "The content of article is #{row['text']}"
      puts "Write file OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK"
      f.close
      puts "File is close OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK"   		
   	end
  end
end

puts "Write record to file OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK"