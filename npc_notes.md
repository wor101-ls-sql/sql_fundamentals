**npcs**
id serial primary key
name text not null
statblock_name
statblock_link


**npcs_relationships**
id serial primary key
party1_id
party2_id
relationship_id FOREIGN KEY refrences relationships(id)


**relationships**
id serial primary key
attitude varchar(10) NOT NULL
description text
