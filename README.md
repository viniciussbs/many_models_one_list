# Many Models, One List

Listing 2 ActiveRecord based classes normalized as a PORO

## Scenario

I have these 2 models:

- `User(id: integer, name: string, cpf: string, ads_count: integer)`
- `Company(id: integer, name: string, cnpj: string, ads_count: integer)`

Both users and companies are advertisers. I want to list advertisers ordered by their number of ads, no matter if it's an user or a company. An advertiser might look like this:

`Advertiser(category: string, name: string, document: string, ads_count: integer)`

`category` says if the advertiser is an user or a company and `document` gives me the user CPF or the company CNPJ (CPF and CNPJ are brazilian documents for civils and companies).
