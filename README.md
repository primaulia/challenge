# Version 1 Logs
## Setting up model

These are the sequences to make the models based on the ERD

1. `Menu` ✅
2. `Section` ✅
3. `MenuSection` -> N:N join tables between `Menu` and `Section` ✅
4. `Item` -> Item is an STI model because it can have multiple types ✅
5. `SectionItem` -> N:N join tables between `Section` and `Item` ✅
6. `ModifierGroup` ✅
7. `ItemModifierGroup` -> N:N join tables between `ModifierGroup` and `Item` ✅
8. `Modifier` -> N:N join tables between `ModifierGroup` and `Component` `Item` ✅
9. Setup seed data v1 ✅

### To be confirmed?

- What's the purpose of these `Menu` properties?: `state`, `start_date`, and `end_date`? --> Left it blank for now

### General assumptions

- Assumed that each table will have `id` and `timestamps` values for sanity check ✅
- `identifier`: probably some internal serial number for the model. A surrogate key perhaps. ✅
- `label`: human-readable name for the customer ✅
- Assumed that there's no further subsection within a section
- Assumed that there's no product item that gets bundled into another product item (i.e. meal product)
- For reference, I've made a [sample table data structure](https://docs.google.com/spreadsheets/d/1S4lpWa5gyv4wDG6tF1dYOjXQe59dI2GACvaRruEHMkA/edit?usp=sharing) that can be referred here

#### Menu

##### Properties

- `state`: assumed that we can have multiple statuses for the menu (not a binary True/False)
- `start_date` & `end_date`: assumed that each `menu` can be public on certain dates or public all the time

#### Item

- Assumed that it's an STI model because it can be a `Product` item or `Component` item
- For simplicity, we rename the `type` keyword to `item_type` because `type` is a reserved keyword
  ![Screenshot 2024-02-10 at 1 30 20 PM](https://github.com/primaulia/grain-challenge/assets/1294303/2b9e5398-5907-4155-911c-b19995c8ebd2)

#### Section

- When a `section` is deleted, it will only delete the join tables, but not the actual tables with the has_many: :through
- i.e. Deleting `Section` `Classic Pizzas` will not delete the `Pizza menu`, nor it will delete the `Margherita Pizza`

#### ModifierGroup

- Acts like a choice to modify a `Product` item
- The `selection_required_[min|max]` represents that the end-user can choose one more modification to the item
  - e.g. `Margherita Pizza` can have 0 or 2 sauces
- This model has two kinds of relationship with `Item`.
  - If the item is a `Product`, Item can have a 1:N association to a `ModifierGroup`
    ![Screenshot 2024-02-10 at 2 30 37 PM](https://github.com/primaulia/grain-challenge/assets/1294303/1568909a-102f-40fa-83f9-ad3cd0e127a7)
  - If the item is a `Component`, `ModifierGroup` can have a 1:N association to the `Item`
    ![Screenshot 2024-02-10 at 2 32 56 PM](https://github.com/primaulia/grain-challenge/assets/1294303/0c0683a9-547b-4f1b-b54f-9ba87c2eb43b)

### Validation assumed

- All labels and identifiers must be present
- The `selection_required_min|man` must be validated
- Each join table values must be unique

### Extra refactoring

- Put the label and identifier standardizer within a concern ✅
- Put the display order validator in a concern ✅

## GraphQL

Endpoint can all be tested [here](https://rocky-garden-09963-4854436a9bbe.herokuapp.com/graphiql).

Here are some of the available queries and mutations on this published iteration.

### Menu

- Get all menus
- Get a menu by id
- Create a new menu

### Section

- Get all sections
- Get a section by id
- Create a new section per menu

### Item

- Get all items and the associated modifier and modifier groups
- Get all product items
- Get all component items
- Get an item by id
- Create a new item per section
- Link an item to a modifier group (product item only)

### Modifier Group

- Get all modifier groups and the associated modifier and items
- Get a modifier group by id
- Create a new modifier group
- Link a modifier to an item (component item only)

# Version 2 Logs

## Changelogs

- 
