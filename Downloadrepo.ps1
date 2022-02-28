function Downloadrepo
{ 
    param( 
       [Parameter(Mandatory=$True)] 
       [string] $Name, 
        
       [Parameter(Mandatory=$True)] 
       [string] $Author, 
        
       [Parameter(Mandatory=$False)] 
       [string] $Branch = "master", 
        
       [Parameter(Mandatory=$False)] 
       [string] $Location = "C:\Users\win8\Downloads\Exploit" 
    ) 
    
    #Creating zip file
    $ZipFile = "$location\$Name.zip" 
    New-Item $ZipFile -ItemType File -Force
    $RepositoryZipUrl = "https://api.github.com/repos/$Author/$Name/zipball/$Branch"  
    # download the zip 
    Write-Host 'Starting downloading the GitHub Repository'
    Invoke-RestMethod -Uri $RepositoryZipUrl -OutFile $ZipFile
    Write-Host 'Download finished'

    #Extracting Zip
    Write-Host 'Starting unziping the GitHub Repository locally'
    Expand-Archive -Path $ZipFile -DestinationPath $location -Force
    Write-Host 'Unzip finished'
    
    #Removing Zip
    Remove-Item -Path $ZipFile -Force 
}
[String]$location = Split-Path -Parent "C:\Users\win8\Downloads\Exploit"

