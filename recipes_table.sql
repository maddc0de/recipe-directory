CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  name text,
  cooking_time int,
  rating int
);

INSERT INTO "public"."recipes" ("name", "cooking_time", "rating") VALUES
('Cookies', 30, 5),
('Adobo', 45, 4),
('Banana Bread', 75, 4),
('Apple Crumble', 55, 5);