## Category
Category has been splits into 3 types: folder, playlist and tag.
These will make the management of entity more easier.

See details [here](https://docs.uiza.io/#category).

## Create category
Create category for entity for easier management.
Category use to group all the same entities into a group (like `Folder`/`playlist` or `tag`).

See details [here](https://docs.uiza.io/#create-category).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {
  name: "Folder sample",
  type: "folder",
  description: "Folder description"
}

begin
  category = Uiza::Category.create params
  puts category.id
  puts category.name
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

Example Response
```ruby
{
  "id": "f932aa79-852a-41f7-9adc-19935034f944",
  "name": "Playlist sample",
  "description": "Playlist description",
  "slug": "playlist-sample",
  "type": "playlist",
  "orderNumber": 3,
  "icon": "https:///example.com/image002.png",
  "status": 1,
  "createdAt": "2018-06-18T04:29:05.000Z",
  "updatedAt": "2018-06-18T04:29:05.000Z"
}
```

## Retrieve category
Get detail of category.

See details [here](https://docs.uiza.io/?shell#retrieve-category).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

begin
  category = Uiza::Category.retrieve "your-category-id"
  puts category.id
  puts category.name
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

Example Response
```ruby
{
  "id": "f932aa79-852a-41f7-9adc-19935034f944",
  "name": "Playlist sample",
  "description": "Playlist description",
  "slug": "playlist-sample",
  "type": "playlist",
  "orderNumber": 3,
  "icon": "https:///example.com/image002.png",
  "status": 1,
  "createdAt": "2018-06-18T04:29:05.000Z",
  "updatedAt": "2018-06-18T04:29:05.000Z"
}
```

## Retrieve category list
Get all category.

See details [here](https://docs.uiza.io/#retrieve-category-list).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

begin
  categories = Uiza::Category.list
  puts categories.first.id
  puts categories.first.name
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

Example Response
```ruby
[
  {
    "id": "f932aa79-852a-41f7-9adc-19935034f944",
    "name": "Playlist sample",
    "description": "Playlist desciption",
    "slug": "playlist-sample",
    "type": "playlist",
    "orderNumber": 3,
    "icon": "/example.com/image002.png",
    "status": 1,
    "createdAt": "2018-06-18T04:29:05.000Z",
    "updatedAt": "2018-06-18T04:29:05.000Z"
  },
  {
    "id": "ab54db88-0c8c-4928-b1be-1e7120ad2c39",
    "name": "Folder sample",
    "description": "Folder's description",
    "slug": "folder-sample",
    "type": "folder",
    "orderNumber": 1,
    "icon": "/example.com/icon.png",
    "status": 1,
    "createdAt": "2018-06-18T03:17:07.000Z",
    "updatedAt": "2018-06-18T03:17:07.000Z"
  }
]
```

## Update category
Update information of category.

See details [here](https://docs.uiza.io/#update-category).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {
  id: "your-category-id",
  name: "Folder edited",
  type: "folder"
}

begin
  category = Uiza::Category.update params
  puts category.id
  puts category.name
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

Example Response
```ruby
{
  "id": "f932aa79-852a-41f7-9adc-19935034f944",
  "name": "Folder edited",
  "description": "Playlist description",
  "slug": "playlist-sample",
  "type": "folder",
  "orderNumber": 3,
  "icon": "https:///example.com/image002.png",
  "status": 1,
  "createdAt": "2018-06-18T04:29:05.000Z",
  "updatedAt": "2018-06-18T04:29:05.000Z"
}
```

## Delete category
Delete category.

See details [here](https://docs.uiza.io/#delete-category).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

begin
  category = Uiza::Category.delete "your-category-id"
  puts category.id
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

Example Response
```ruby
{
  "id": "f932aa79-852a-41f7-9adc-19935034f944"
}
```

## Create category relation
Add relation for entity and category.

See details [here](https://docs.uiza.io/#create-category-relation).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {
  entityId: "your-entity-id",
  metadataIds: ["your-category-id-1", "your-category-id-2"]
}

begin
  relations = Uiza::Category.create_relation params
  puts relations.first.id
  puts relations.first.entityId
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

Example Response
```ruby
[
  {
    "id": "5620ed3c-b725-4a9a-8ec1-ecc9df3e5aa6",
    "entityId": "16ab25d3-fd0f-4568-8aa0-0339bbfd674f",
    "metadataId": "095778fa-7e42-45cc-8a0e-6118e540b61d"
  },
  {
    "id": "47209e60-a99f-4c96-99fb-be4f858481b4",
    "entityId": "16ab25d3-fd0f-4568-8aa0-0339bbfd674f",
    "metadataId": "e00586b9-032a-46a3-af71-d275f01b03cf"
  }
]
```

## Delete category relation
Delete relation for entity and category.

See details [here](https://docs.uiza.io/#delete-category-relation).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {
  entityId: "your-entity-id",
  metadataIds: ["your-category-id-1", "your-category-id-2"]
}

begin
  relations = Uiza::Category.delete_relation params
  puts relations.first.id
  puts relations.first.entityId
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

Example Response
```ruby
[
  {
      "id": "5620ed3c-b725-4a9a-8ec1-ecc9df3e5aa6",
      "entityId": "16ab25d3-fd0f-4568-8aa0-0339bbfd674f",
      "metadataId": "095778fa-7e42-45cc-8a0e-6118e540b61d"
  },
  {
      "id": "47209e60-a99f-4c96-99fb-be4f858481b4",
      "entityId": "16ab25d3-fd0f-4568-8aa0-0339bbfd674f",
      "metadataId": "e00586b9-032a-46a3-af71-d275f01b03cf"
  }
]
```