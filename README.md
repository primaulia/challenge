# Thought process

## Setting up model

These are the sequences to make the models based on the ERD

1. `Menu`
2. `Section`
3. `MenuSection` -> N:N join tables between `Menu` and `Section`
4. `Item` -> Item is a polymorphic model because it can have multiple type
5. `SectionItem` -> N:N join tables between `Section` and `Item`
6. `ModifierGroup`
7. `Modifier` -> N:N join tables between `ModifierGroup` and `Item`
8. `ItemModifierGroup`

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
