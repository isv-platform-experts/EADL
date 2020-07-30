# How to setup org with this project?

## Option 1
- Clone this repo locally: 
-- git clone https://github.com/isv-platform-experts/EADL
- Run orgInit.sh
-- ./orgInit.sh

## Option 2

- Go to http://hosted-scratch.herokuapp.com/#userinfo?template=https://github.com/isv-platform-experts/EADL
- Enter your email and click Submit
- Click "Launch"


# is there anything else that needs to be done?
- You will need to edit the  page where you want this dashboard
- Add a "Einstein Analytics Dashboard" component on the page
- Select "Template Dashboard without Dataset" as your Dashboard for that component
- Save and activate the page
- Click Back to go back to your page

## Why is this not automated?
As part of the setup, we create dashboard from analytics template. This is an asynchronous process. Hence we cannot push pre-configured pages to the org as that step will fail (because dashboard creation may not be finished by then).


