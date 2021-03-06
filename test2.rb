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
@driver.find_element(:link , 'Наушники и Bluetooth-гарнитуры').click

@driver.find_element(:css , 'div._2Wdscr8iIC').click #Кнопка все фильтры
@driver.find_element(:id , 'glf-pricefrom-var').send_keys '5000'

@driver.find_element(:xpath , "//label[@class = 'checkbox__label' and text() = 'Beats']").click
@driver.find_element(:link , 'Показать подходящие').click

elem = @driver.find_elements(:css , 'div.n-snippet-cell2__title')

if elem.size > 12
  puts 'elementov na stranice bolshe 12, tocnoe kol-vo: ' + elem.size.to_s
else puts 'elementov na stranice <= 12'
end

name1 = elem[0].text # название первых наушников
puts 'nazvanie pervih naushnikov v spiske: ' + name1

@driver.find_element(:id , 'header-search').send_keys name1

#element1 = @driver.find_element(:css , 'span.suggest2-autocomplete__entered')
element2 = @driver.find_elements(:css , 'div.n-snippet-cell2__title').first

if name1 == element2.text
  puts 'nazvanie 1 elementa sovpadaet s elementom v poiskovoi stroke'
else puts 'nazvaniya ne sovpadauyt'
end