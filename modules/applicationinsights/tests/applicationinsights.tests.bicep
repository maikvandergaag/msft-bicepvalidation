
param location string = resourceGroup().location

module test_param '../applicationinsights.bicep'={
  name: 'test-param'
  params: {
    name: 'app-insights'
    environment: 'prd'
    logAnalyticsWorkspaceId: '/subscriptions/<subscription_id>/resourceGroups/rg-test/providers/Microsoft.OperationalInsights/workspaces/latest001' 
    location: location
  }
}


