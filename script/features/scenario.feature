Feature: Market
  Scenario: Phones

    Given Open market
    And Elektronika
    And Smatfoni
    And Vse filtri
    And Diapazon cen ot 20000
    And Proizvoditel Apple
    And Proizvoditel Sumsung
    And Podhodyashie
    And Proverka kolva elementov na stranice
    Given Perviy elem v spiske
    And Vvel v poisk nazvanie 1 elem
    And Najal na knopku naiti
    Then Proveril cnhto sovp
