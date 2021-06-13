driver.get('https://mail.google.com/mail/u/0/#inbox')
driver.implicitly_wait(15)

loginBox = driver.find_element_by_xpath('//*[@id ="identifierId"]')
loginBox.send_keys('email')

nextButton = driver.find_elements_by_xpath('//*[@id ="identifierNext"]')
nextButton[0].click()

passWordBox = driver.find_element_by_xpath('//*[@id ="password"]/div[1]/div / div[1]/input')
passWordBox.send_keys('password')

nextButton = driver.find_elements_by_xpath('//*[@id ="passwordNext"]')
nextButton[0].click()
time.sleep(2)                                 
time.sleep(2)
         
                                    #      //*[@id=":df"]/div/div   //*[@id=":df"]/div/div
  
try:

    driver.find_element_by_xpath('//div[contains(text(),"Compose")]').click()
    driver.find_element_by_xpath('//textarea[contains(@name,"to")]').send_keys('abubakkerhashmi123@gmail.com')
    driver.find_element_by_xpath('//input[contains(@name,"subjectbox")]').send_keys('Test Mail')

    bodyElem = driver.find_element_by_css_selector("div[aria-label='Message Body']") #this is where I get stuck and not sure what to do here
    bodyElem.send_keys('A test email withh selenium frm try')

   
    driver.get('https://mail.google.com/mail/u/0/#sent')
    
    # attach_file=driver.find_elements_by_id(':qn')
    # attach_file.click()
    print('choose file')
    fileInputElement = driver.find_element_by_css_selector('input[type="file"]')
    driver.execute_script("((el) => el.style.display = 'block', fileInputElement)")
    fileInputElement.send_keys('C:\\Users\\TCV\\Desktop\\abc')

    print('do you me want to send try ?')
    a=input('?')
    if 'yes' in a :
        sendElem = driver.find_element_by_xpath("//div[text()='Send']")
        sendElem.click()
    