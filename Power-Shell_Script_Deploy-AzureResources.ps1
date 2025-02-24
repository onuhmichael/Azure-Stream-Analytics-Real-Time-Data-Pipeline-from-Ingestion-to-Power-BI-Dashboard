# Deploy-AzureResources.ps1

# Variables for resource configuration
$resourceGroup = "mikestreamanalytics"     # Name of the resource group
$location = "UK West"                      # Azure region where resources will be deployed
$iotHubName = "mikeIoTHub"                 # Name of the Azure IoT Hub
$streamAnalyticsJobName = "mikeStreamAnalyticsJob"   # Name of the Stream Analytics Job
$storageAccountName = "gn2storageaccount"  # Name of the Azure Storage Account

# Step 1: Create Resource Group
# A resource group is a container that holds related Azure resources
New-AzResourceGroup -Name $resourceGroup -Location $location
Write-Output "Resource group '$resourceGroup' created in '$location'."

# Step 2: Create IoT Hub
# IoT Hub captures and streams incoming data from IoT devices
New-AzIotHub -ResourceGroupName $resourceGroup -Name $iotHubName -SkuName S1 -Location $location
Write-Output "IoT Hub '$iotHubName' created successfully."

# Step 3: Create Stream Analytics Job
# Stream Analytics Job processes and analyzes streaming data using SQL-like queries
New-AzStreamAnalyticsJob -ResourceGroupName $resourceGroup -Name $streamAnalyticsJobName -Location $location -SkuName "Standard"
Write-Output "Stream Analytics Job '$streamAnalyticsJobName' created successfully."

# Step 4: Create Storage Account
# Storage Account stores processed data for further analysis or backup
New-AzStorageAccount -ResourceGroupName $resourceGroup -Name $storageAccountName -Location $location -SkuName "Standard_LRS"
Write-Output "Storage Account '$storageAccountName' created successfully."

Write-Output "All Azure resources deployed successfully."

# ---

# Destroy-AzureResources.ps1

# Step 5: Remove Resource Group and All Resources
# This command will remove the resource group and all the services inside it
Remove-AzResourceGroup -Name $resourceGroup -Force
Write-Output "Resource group '$resourceGroup' and all associated resources removed successfully."

# ---

# How to Deploy via Azure Portal
# 1. Open the Azure Portal: https://portal.azure.com/
# 2. Open Cloud Shell (top-right corner) and choose PowerShell
# 3. Upload this script file or copy and paste the script directly into Cloud Shell
# 4. Execute the deployment script by running ./Deploy-AzureResources.ps1
# 5. To clean up, execute the destroy script by running ./Destroy-AzureResources.ps1

# Note: Ensure you have the necessary permissions to create and delete resources in the chosen Azure subscription.
