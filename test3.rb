require 'selenium-webdriver'
require 'rspec'
require 'russian'


@driver = Selenium::WebDriver.for :firefox
#@driver = Selenium::WebDriver.for :chrome
@wait = Selenium::WebDriver::Wait.new(:timeout => 10)
@driver.get('http://www.yandex.ru')
@driver.manage().window().maximize()



@driver.find_element(:link , 'Маркет').click
@driver.find_element(:link , 'Электроника').click
@driver.find_element(:link , 'Смартфоны').click
@driver.find_element(:link , 'по цене').click
@driver.navigate.refresh
elem = @driver.find_elements(:css , 'div.price')

for j in 0..(elem.size-1)
 elem[j] = elem[j].text.delete(' ')
end

for j in 0..(elem.size-1)
  puts elem[j].to_i
end

  for i in 0..(elem.size-1)
      if elem[i].to_i < elem[i+1].to_i
     #x = 0
       puts 'elementi otsortirovani ne verno'
       break
      end

      if i == (elem.size-1)
    puts 'elementi otsortirovani verno'
      end
    #x = 1
  end

#if x == 1
#  puts 'elementi otsortirovani verno'
#  else puts 'otsortirovani ne verno'
#end
