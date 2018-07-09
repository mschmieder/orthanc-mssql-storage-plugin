# Orthanc Plugin for storing in Azure Blob Storage

## Configuration
To enable the plugin within your Orthanc server, setup the location of the plugin within the Orthanc configuration file.

Windows:
```json
"Plugins" : [
"OrthancAzureBlobStorage.dll"
]
```

Linux:
```json
"Plugins" : [
"OrthancAzureBlobStorage.so"
]
```

MacOS:
```json
"Plugins" : [
"OrthancAzureBlobStorage.dll"
]
```

After that either add the plugin specific configuration into Orthanc's main configuration file, or setup Orthanc to parse all json files within a folder.

```json
"AzureBlobStorage" : {
    "EnableStorage" : true,
    "ConnectionString" : "DefaultEndpointsProtocol=https;AccountName=XXXXXXXXXXXXXX;AccountKey=YYYYYYYYYYYYYYYYY;EndpointSuffix=core.windows.net",
    "ContainerName" : "orthanc-storage"
}
```

## Building
The plugin can be build on all major platforms. 

### Unix/MacOS

```bash
# bootstrap the system in order to retrieve necessary thridparties libraries as well as the orthanc sources
./bootstrap.sh

cd build
cmake --build . --config release --target install -- -j
cmake --build . --config debug --target install -- -j
```
