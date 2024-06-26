# Bachelor-exam

## Table of Contents
- [Introduktion](#introduktion)
- [Projektoversigt](#projektoversigt)
- [Funktioner](#funktioner)
- [Teknologier](#teknologier)
- [Test](#test)
- [Contributers](#contributers)

## Introduktion
Dette repository indeholder koden og ressourcerne til bachelorprojektet "Automatisering af Cloud Tjenester i Relation til Kundetilpasning." Projektet fokuserer på at udnytte cloud-integration for at forbedre fleksibilitet, skalerbarhed og pålidelighed i softwareudvikling gennem automatisering.

## Projektoversigt
Projektet undersøger fordelene ved integration af cloud-tjenester for at automatisere forskellige processer, minimere manuelle interventioner og forbedre omkostningseffektiviteten. Centrale teknologier inkluderer Terraform til Infrastructure as Code (IaC) og Azure Monitor til forbedret overvågning.

## Funktioner
- **Automatiseret Infrastrukturstyring**: Brug af Terraform til effektivt at administrere cloud-ressourcer.
- **Dynamisk Skalering**: Implementering af Azures autoskaleringstjenester for at tilpasse sig varierende arbejdsbyrder.
- **Omfattende Overvågning**: Integration med Azure Monitor og Application Insights for robust operationel pålidelighed.
- **Omkostningsoptimering**: Strategier til optimering af driftsomkostninger gennem automatisering.

## Test
I dette projekt har vi gjort brug af sproget Go til at udvikle tests. Vi har udarbejdet en omfattende end-to-end (e2e) test, der sikrer korrekt oprettelse af moduler og ressourcer, som korrekt skal eksekveres og køres.

Teststrategien inkluderer:
- **End-to-End Testning**: Verificering af hele infrastrukturens funktionalitet.
- **Automatiserede Tests**: Brug af Terraform's `terraform init`, `terraform plan` og `terraform apply` kommandoer til at sikre, at alle ressourcer oprettes og fungerer korrekt.
- **Oprydning af Ressourcer**: Automatisk fjernelse af ressourcer efter testning for at undgå unødvendige omkostninger og holde miljøet rent.

## Teknologier
Projektet er bygget med følgende teknologier:
- Terraform
- Azure
    - Azure Monitor
    - Application Insights
- Go

## Contributers
- Mathias Drejer
- Tobias Linge
- Robert Pallesen