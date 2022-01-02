*** Settings ***
Library  SeleniumLibrary
Library  DebugLibrary
Library  FakerLibrary
Test Setup  create browser
Test Teardown   close browser

*** Variables ***
${browser}  chrome
${TIMEOUT}  30 seconds
${site}  https://www.gittigidiyor.com
${selector_searchinput}  xpath://input[@data-cy="header-search-input"]
${selector_findbutton}  xpath://button[@data-cy="search-find-button"]
${selector_clear}  xpath://div[@data-cy="input-clear-button"]
${first_item}  xpath://div[@class="sc-533kbx-0 sc-1v2q8t1-0 iCRwxx ixSZpI sc-1n49x8z-12 bhlHZl"]
${add_button}  xpath://button[@id="add-to-basket"]
${size_shirt}  xpath://span[text()="M"]
${cookie_button}  xpath://span[text()="Kapat"]
${cookie_button_phone}  xpath://section[@class="tyj39b-4 gAqqOR"]
${explore}  xpath://div[@name="mobil"]
${basket_button}  xpath://div[@class="gekhq4-6 hnYHyk"]
${remove_button}  xpath://i[@class="gg-icon gg-icon-bin-medium"]
${my_basket}  https://www.gittigidiyor.com/sepetim
${quick_buy}  xpath://button[@id="buy-now"]
${login_site}  https://www.gittigidiyor.com/uye-girisi
${loginbutton}  xpath://input[@id="L-UserNameField"]
${loginPassword}  xpath://input[@type="password"]
${login}  xpath://input[@alt="Giriş Yap"]
${login_explore}  xpath://a[@title="Online Alışveriş Sitesi"]
${login_remember}  xpath://label[@class="remember"]
${color_shirt}  xpath://span[text()="Beyaz"]
${payement}  xpath://input[@type="submit"]
${üyeolmadan}  xpath://input[@value="Üye Olmadan Devam Et"]
${adres_xpath}  xpath://textarea[@name="addressDetail"]
${name_xpath}  xpath://input[@name="firstName"]
${surname_xpath}  xpath://input[@name="surName"]
${email_xpath}   xpath://input[@data-type="email"]
${phone_xpath}  xpath://input[@name="gsm"]
${teslim_xpath}  xpath://input[@name="phone"]
${city_xpath}  xpath://select[@name="cityCode"]
${cityDetails_xpath}  xpath://option[@value="34"]
${country_xpath}  xpath://select[@name="countryCode"]
${countryDetails_xpath}  xpath://option[@value="474"]
${neighborhood_xpath}  xpath://select[@name="neighborhoodCode"]
${neighborhoodDetails_xpath}  xpath://option[@value="36285"]
${creditCardNumber_xpath}  xpath://input[@id="CcNumber"]
${creditCardName_xpath}  xpath://input[@id="CcOwner"]
${creditCardMonth_xpath}   xpath://select[@name="month"]
${creditCardMonthDetails_xpath}   xpath://select[@name="month"]
${payScreensaveButton}   xpath://button[@value="Kaydet"]
${appleButton}   xpath://a[@title="Apple"]
${freeDelivery}   xpath://button[@aria-label="Ücretsiz Kargo"]
${telephoneSize}  xpath://p[@class="sc-1tdlrg-0 yf6n83-0 gKdSCC iyhgDU"]
${telephoneMemory}  xpath://ul/div[last()]
#ul/div[last()] ul içinde olan sıralı divlerin sonuncusunu getiriyor.last() yerine istenilen sıradaki sayıda yazılabilir.
${campaignPhotos}  xpath://div[@class="psxmjs-0 jTNdHi"]
${sortFilter}   xpath://select[@aria-label="Sıralama filtresi"]
${selectedValue}   xpath://option[@value="hpa"]


*** Keywords ***
create browser
    open browser  about:blank  ${browser}
    Set Selenium Timeout  ${TIMEOUT}
    maximize browser window
    go to  ${site}
FakerEmail
    ${Email} =  FakerLibrary.Company Email
    Wait Until Page Contains Element  ${email_xpath}
    Click Element  ${email_xpath}
    input text  ${email_xpath}  ${Email}  False
FakerAdres
    ${Address} =  FakerLibrary.Address
    Wait Until Page Contains Element  ${adres_xpath}
    Click Element  ${adres_xpath}
    input text  ${adres_xpath}  ${Address}  False

FakerName
    ${FakerName} =  FakerLibrary.Name
    Wait Until Page Contains Element  ${name_xpath}
    Click Element  ${name_xpath}
    input text  ${name_xpath}  ${FakerName}  False
FakerSurname
    ${FakerSurName} =  FakerLibrary.Last Name
    Wait Until Page Contains Element  ${surname_xpath}
    Click Element  ${surname_xpath}
    input text  ${surname_xpath}  ${FakerSurName}  False
FakerPhone
    ${phoneNumber} =  FakerLibrary.Phone Number
    Wait Until Page Contains Element  ${phone_xpath}
    Click Element  ${phone_xpath}
    input text  ${phone_xpath}  ${phoneNumber}  False

FakerTeslim
    ${FakerTeslim} =  FakerLibrary.Phone Number
    Wait Until Page Contains Element  ${teslim_xpath}
    Click Element  ${teslim_xpath}
    input text  ${teslim_xpath}  ${FakerTeslim}  False
FakerCreditCard
    ${FakerCreditCard} =  FakerLibrary.Credit Card Number
    Wait Until Page Contains Element  ${creditCardNumber_xpath}
    Click Element  ${creditCardNumber_xpath}
    input text  ${creditCardNumber_xpath}  ${FakerCreditCard}  False
FakerCreditCardName
    ${FakerCreditCardName} =  FakerLibrary.Name
    Wait Until Page Contains Element  ${creditCardName_xpath}
    Click Element  ${creditCardName_xpath}
    input text  ${creditCardName_xpath}  ${FakerCreditCardName}  False
press enter
    Press Keys  NONE  ENTER
click
    [Arguments]   ${selector}
    Wait Until Page Contains Element  ${selector}
    Click Element  ${selector}

go to shirt page
    Wait Until Page Contains Element  ${explore}
    Click  ${cookie_button}
    Click  ${first_item}
    Click  ${cookie_button}
    Click  ${quick_buy}
    Sleep  2s
    Click  ${size_shirt}
    Sleep  2s
#    Click  ${color_shirt}
#    Sleep  2s
    Click  ${add_button}
    Sleep  5s
    Go To  ${my_basket}
    Sleep  2s

go to phone page
    # Wait Until Page Contains Element  ${first_item}
    Click Element  ${cookie_button_phone}
    Click Element  ${first_item}
    Wait Until Page Contains Element  ${explore}
    # Click Element  ${cookie_button_phone}
    Click Button  ${add_button}
    # Sleep  ${TIMEOUT}

delete item
    Click   ${remove_button}
    Sleep  10s

fill the username
    [Arguments]  ${loginAdmin}
    Wait Until Page Contains Element  ${loginbutton}
    Input Text  ${loginbutton}  ${loginAdmin}
fill the password
    [Arguments]  ${loginAdmin}
    Wait Until Page Contains Element  ${loginPassword}
    Input Password  ${loginPassword}  ${loginAdmin}


Search product
    [Arguments]  ${product_name}
    Wait Until Page Contains Element  ${selector_searchinput}
    Input Text  ${selector_searchinput}  ${product_name}
    Wait Until Page Contains Element  ${selector_findbutton}
    Click Element  ${selector_findbutton}

clear input
    ##gittigidiyor.com için search barda bulunan 'x' göstergesine basarak temizleme yapılıp yenisi yazıldı
    Wait Until Page Contains Element  ${selector_searchinput}
    Click Element  ${selector_searchinput}
    Click Element  ${selector_clear}

Swipe Down Half
    Execute JavaScript  window.scrollBy(0,700);

Swipe Down
    Execute JavaScript  window.scrollBy(0,1500);

*** Test Cases ***
searchBarControl
    Search Product  bilgisayar
    Sleep  7s

searchBardelete
    Search Product  telefon
    Clear Input
    Search Product  krampon
    Clear Input
    Search Product  oje
    Clear Input
    Sleep  3s
    go to  ${site}
    Sleep  10s

addToBasketForShirt
    Search Product  gömlek
    Sleep  2s
    go to shirt page
    Sleep  10s

BasketForShirtToRemove
    Search Product  gömlek
    Sleep  2s
    go to shirt page
    Sleep  5s
    Delete Item
    Sleep  10s
enter the username and password
    go to  ${site}
    go to  ${login_site}
    Wait Until Page Contains Element  ${login_explore}
    Fill The Username  admin
    Fill The Password  denemetest123
    Click  ${login_remember}
    Sleep  2s
    Click  ${login}
    Sleep  10s

go to pay screen
    Search Product  gömlek
    go to shirt page
    Sleep  5s
    Click  ${payement}
    Click  ${üyeolmadan}
    FakerName
    Sleep  2s
    FakerSurname
    Sleep  2s
    FakerEmail
    Sleep  2s
    FakerPhone
    Sleep  2s
    FakerTeslim
    Sleep  2s
    FakerAdres
    Click  ${city_xpath}
    Sleep  2s
    Click  ${cityDetails_xpath}
    Sleep  2s
    Click  ${country_xpath}
    Sleep  2s
    Click  ${countryDetails_xpath}
    Sleep  2s
    Click  ${neighborhood_xpath}
    Sleep  2s
    Click  ${neighborhoodDetails_xpath}
    Sleep  2s
    Click  ${payScreensaveButton}
    Sleep  10s

filter the phone
    Search Product  Telefon
    Swipe Down Half
    Click  ${cookie_button}
    Click  ${appleButton}
    Sleep  2s
    Click  ${freeDelivery}
    Sleep  2s
    Click  ${telephoneSize}
    Sleep  10s

click the campaign
    Sleep  2s
    Click  ${campaignPhotos}
    Sleep  2s
    Switch Window
    Switch Window  Oral-B iO - GittiGidiyor
    Sleep  2s
    Click  ${cookie_button}
    Sleep  2s
    click  ${sortFilter}
    Sleep  2s
    click  ${selectedValue}
    Sleep  2s
    Swipe Down
    Sleep  10s










