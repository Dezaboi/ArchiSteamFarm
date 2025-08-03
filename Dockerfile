FROM mcr.microsoft.com/dotnet/runtime:9.0-preview AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:9.0-preview AS build
WORKDIR /src
COPY . .
RUN dotnet publish ArchiSteamFarm/ArchiSteamFarm.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "ArchiSteamFarm.dll"]
