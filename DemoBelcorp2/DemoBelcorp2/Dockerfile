#Depending on the operating system of the host machines(s) that will build or run the containers, the image specified in the FROM statement may need to be changed.
#For more information, please see https://aka.ms/containercompat 

FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY DemoBelcorp2/*.csproj ./DemoBelcorp2/
COPY DemoBelcorp2/*.config ./DemoBelcorp2/
RUN nuget restore

# copy everything else and build app
COPY DemoBelcorp2/. ./DemoBelcorp2/
WORKDIR /app/DemoBelcorp2
RUN msbuild /p:Configuration=Release

# copy build artifacts into runtime image
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8 AS runtime
WORKDIR /inetpub/wwwroot
COPY --from=build /app/DemoBelcorp2/. ./

# Copy LogMonitor.exe to the root of the container's file system
WORKDIR /LogMonitor
SHELL ["C:\\LogMonitor\\LogMonitor.exe", "powershell.exe"]
COPY LogMonitor.exe LogMonitorConfig.json ./
RUN New-EventLog -source WinContainerApp -LogName Application

# Set the EntryPoint for the container to "LogMonitor.exe"
ENTRYPOINT ["C:\\LogMonitor\\LogMonitor.exe", "C:\\ServiceMonitor.exe", "w3svc"]