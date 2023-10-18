
param location string = resourceGroup().location

module test_functionapp '../functionapp.bicep'={
  name:'test-functionapp'
  params:{
    name: 'test-functionapp'
    env: 'dev'
    location: location
  }
}
