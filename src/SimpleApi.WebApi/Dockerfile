FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY ["SimpleApi.WebApi/SimpleApi.WebApi.csproj", "SimpleApi.WebApi/"]
RUN dotnet restore "SimpleApi.WebApi/SimpleApi.WebApi.csproj"
COPY . .
WORKDIR "/src/SimpleApi.WebApi"
RUN dotnet build "SimpleApi.WebApi.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "SimpleApi.WebApi.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "SimpleApi.WebApi.dll"]
