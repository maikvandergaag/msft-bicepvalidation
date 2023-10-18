
param location string = resourceGroup().location

module test_functionapp '../loganalytics.bicep'={
  name:'test-functionapp'
  params:{
    name: 'test-functionapp'
    environment: 'acc'
    location: location
  }
}
