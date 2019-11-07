Given("Open market") do
  @driver = Selenium::WebDriver.for :firefox
  @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  @driver.get('http://www.yandex.ru')
  @driver.manage().window().maximize()

  @driver.find_element(:link , 'Маркет').click
end

And("Elektronika") do
  @driver.find_element(:link , 'Электроника').click
end

And("Smatfoni") do
  @driver.find_element(:link , 'Смартфоны').click
end

And("Vse filtri") do
  @driver.find_element(:css , 'div._3U2TeVBOWN').click #Кнопка все фильтры
end

And("Diapazon cen ot 20000") do
  @driver.find_element(:id , 'glf-pricefrom-var').send_keys '20000'
end

And("Proizvoditel Apple") do
  @driver.find_element(:xpath , "//label[@class = 'checkbox__label' and text() = 'Apple']").click
end

And("Proizvoditel Sumsung") do
  @driver.find_element(:xpath , "//label[@class = 'checkbox__label' and text() = 'Samsung']").click
end

And("Podhodyashie") do
  @driver.find_element(:link , 'Показать подходящие').click
end

And("Proverka kolva elementov na stranice") do

  elem = @driver.find_elements(:css , 'div.n-snippet-cell2__title')

  if elem.size > 12
    puts 'elementov na stranice bolshe 12, tocnoe kol-vo: ' + elem.size.to_s
  else puts 'elementov na stranice <= 12'
  end

end

Given("Perviy elem v spiske") do
  elem = @driver.find_elements(:css , 'div.n-snippet-cell2__title')
  name1 = elem[0].text # название первого телефона
  puts 'nazvanie pervogo telefona v spiske: ' + name1
end

And("Vvel v poisk nazvanie 1 elem") do
  elem = @driver.find_elements(:css , 'div.n-snippet-cell2__title')
  name1 = elem[0].text # название первого телефона
  @driver.find_element(:id , 'header-search').send_keys name1
end

And("Najal na knopku naiti")do
  @driver.find_element(:css , 'span.search2__button').click
end

Then("Proveril cnhto sovp") do
  element2 = @driver.find_elements(:css , 'div.n-snippet-cell2__title').first
  name1 = @driver.find_element(:id , 'header-search')
  name2 = name1.attribute("value")

    if name2 == element2.text
      puts 'nazvanie 1 elementa sovpadaet s elementom v poiskovoi stroke'
    else puts 'nazvaniya ne sovpadauyt'
    end
end