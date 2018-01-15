Instructions: 

Pre-requistes: 
* Ruby Installed
* Chrome Driver Installed
* Gecko driver Installed for firefox

Follow below Install Steps: 
* Download the Ruby_Automation folder from Git
* Navigate and CD into Ruby_Automation folder using command line. 
* Perform gem install bundler
* Run Bundle Install 

Environment/ Browser selection: 
* Navigate to Ruby_Automation > Config > cucumber.yml 
	URL=prod (qa/prod) 
	BROWSER=chrome (chrome/firefox) can be selected
	
* Navigate to Ruby_Automation > support > env.rb
	env.rb is the file where you can edit browser driver initialization and other environment details. 
	
Executing All Script or Individual Scripts:

* Navigate to Ruby_Automation folder through command prompt, 
	
	To run all scripts: 
	cucumber --tags @reg 
	
	Indiviual scripts: 
	 cucumber --tags <@tag_name>
	 ex: cucumber --tags @user_login
	 
	 Note: to know individual tags go to Ruby_Automation > Features and open each .feature file
	 and @tag will be displayed on top of heading (Scenario)
	 
	 
Reports: 
* Navigate to Ruby_Automation folder in Finder(Mac) or Internet Explorer(PC) go to log> folder and you 
	will see cucumber.html file with detailed summary test report. 
	
Folder Structure: 

Ruby_Automation >
	Config >
		cucumber.yml (you can edit browser/ environment to qa/prod and code to generate default html cucumber report)
		users.yml (will contain all users/ passwords)
		
	Features >
		Step_definitions (step definitions for all gerkin files will be present )
	
		All .feature files with cucumber gerkins scenarious 
		
	Lib > 
		Pages (All page class files will be present)	
		
	Log >  (cucumber.html report will be present)
	
	Support > (env.rb and hooks.rb files will be present)
		env.rb - contains all environment setup and driver initialization setup
		hooks.rb - contains all steps that needs to be done before and after scenario. 
		
	gemfile - will contain all list of gems that we are using for this framework. 
# auto
# auto
