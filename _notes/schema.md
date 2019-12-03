# Schema

FYI: [Super awesome markdown table generator](https://www.tablesgenerator.com/markdown_tables)

|      USER | SCHEMA                 |
|----------:|------------------------|
| t.string  | :username              |
| t.string  | :password_digest       |
| t.boolean | :admin, default :false |
| t.integer | :account_id            |

|  ACCOUNT | SCHEMA |
|---------:|--------|
| t.string | :name  |
| t.string | :phone |
| t.string | :email |

|      PET | SCHEMA                |
|---------:|-----------------------|
| t.string | :name                 |
| t.string | :breed                |
| t.string | :color                |
| t.string | :feeding_instructions |
| t.string | :medications          |

| ACCOUNT_PET | SCHEMA      |
|------------:|-------------|
| t.integer   | :account_id |
| t.integer   | :pet_id     |

## Future Feature Schemas

|   ACTIVITY | SCHEMA             |
|-----------:|--------------------|
| t.datetime | :date              |
| t.string   | :activity_type     |
| t.string   | :activity_comments |

|      VET | SCHEMA       |
|---------:|--------------|
| t.string | :vet_name    |
| t.string | :clinic_name |
| t.string | :phone       |
