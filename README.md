# Thought process

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

### Menu

#### Properties

- `state`: assumed that we can have multiple statuses for the menu (not a binary True/False)
- `start_date` & `end_date`: assumed that each `menu` can be public on certain dates or public all the time

### Item

- Assumed that it's an STI model because it can be a `Product` item or `Component` item
- For simplicity, we rename the `type` keyword to `item_type` because `type` is a reserved keyword
  ![Screenshot 2024-02-10 at 1 30 20 PM](https://github.com/primaulia/grain-challenge/assets/1294303/2b9e5398-5907-4155-911c-b19995c8ebd2)

### Section

- When a `section` is deleted, it will only delete the join tables, but not the actual tables with the has_many: :through
- i.e. Deleting `Section` `Classic Pizzas` will not delete the `Pizza menu`, nor it will delete the `Margherita Pizza`

### ModifierGroup

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

### Extra refactoring

- Put the label and identifier standardizer within a concern ✅

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
