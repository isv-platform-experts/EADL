## Default org duration to 1 day if argument not set
# ORG_DURATION=1
# TEMPLATE_API_NAME=wave_de__Mortgage_Calculator

# override org duration if argument exists
#if [ "$#" -eq  "0" ]
#then
 #   echo "[INFO] No arguments specified"
#else
 #   ORG_DURATION=$1
#fi

# create scratch org
#echo "INFO] Creating Scratch Org with Duration: $ORG_DURATION Day(s)..."
sfdx force:org:create -f config/project-scratch-def.json -s -d 7 -w 60 -a scratchEATest

#Sample: https://github.com/skipsauls/eadx
#Install package
sfdx force:package:install  -s AllUsers -p 04t5w000005ubuh


#Deploy to packaging org
#sfdx force:source:deploy -u EATemplatePkgOrg -m WaveTemplateBundle

# push the contents of this repo into the scratch org
#echo "[INFO] Pushing source..."
#sfdx force:source:push

# create an app using the auto installer
#Create dashboard from namespaced app template
#sfdx force:data:record:create -s WaveAutoInstallRequest -v "RequestStatus='Enqueued' RequestType='WaveAppCreate' TemplateApiName='eadxtest__TemplateAppTest'"
#sfdx force:data:record:create -s WaveAutoInstallRequest -v 'RequestStatus="Enqueued" RequestType="WaveAppCreate" TemplateApiName="eadxtest__TemplateAppTest" Configuration="{"appConfiguration":{deleteAppOnConstructionFailure:true,autoShareWithLicensedUsers:true,autoShareWithOriginator:true}}"'

#Create dashboard from template
sfdx force:apex:execute -f config/setup.apex

#How to delete this app
#https://github.com/skipsauls/eadx/blob/02b794bdaa5e76dbaeb402d14be6f4346fbfbda7/force-app/main/default/classes/eadlManagerController.cls

#echo "[INFO] Creating the Master App"
#sfdx force:data:record:create -s WaveAutoInstallRequest -v "RequestStatus='Enqueued' RequestType='WaveAppCreate' TemplateApiName='TestNewApp'"
#Check Template to dashboard status
#sfdx force:data:record:get -s WaveAutoInstallRequest -i RECORDID_FROM_CREATE

# view the finished app
#sfdx analytics:app:list

#open the org
sfdx force:org:open



#Retrieve Wave template
#sfdx force:source:retrieve -u EATemplatePkgOrg -m WaveTemplateBundle