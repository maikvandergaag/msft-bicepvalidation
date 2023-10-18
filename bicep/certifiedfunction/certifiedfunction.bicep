metadata info = {
  title: 'Certified Function App'
  description: 'Bicep template to deploy a function app with log analytics and application insights'
  version: '0.0.1'
  author: 'Maik van der Gaag'
}

@description('The name for the function')
param name string

@allowed([
  'tst'
  'acc'
  'prd'
  'dev'
])
@description('The environment were the service is beign deployed to (tst, acc, prd, dev)')
param environment string

@description('The location of the resource group for the function app')

param location string = resourceGroup().location

module function '../../modules/functionapp/functionapp.bicep' ={
  name: 'functionapp'
  params:{
    env: environment
    name: name
    location: location
    appSettings:{
      APPINSIGHTS_INSTRUMENTATIONKEY: appInsights.outputs.InstrumentationKey
      APPLICATIONINSIGHTS_CONNECTION_STRING: appInsights.outputs.ConnectionString
    }
  }
}

module loganalytics '../../modules/loganalytics/loganalytics.bicep' ={
  name: 'loganalytics'
  params: {
    name: name
    environment: environment
  }
}

module appInsights '../../modules/applicationinsights/applicationinsights.bicep' ={
  name: 'applicationinsights'
  params: {
    name: name
    environment: environment
    logAnalyticsWorkspaceId: loganalytics.outputs.workspaceId
  }
}
