-- Table: winter_market.category
CREATE TABLE IF NOT EXISTS "category" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "title" varchar(255) NOT NULL,
    "description" varchar(255),
    CONSTRAINT category_pkey PRIMARY KEY (id),
    CONSTRAINT category_title_key UNIQUE (title)
);

CREATE TABLE IF NOT EXISTS "product" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "vendor_code" varchar(8) NOT NULL,
    "title" varchar(250) NOT NULL,
    "short_description" varchar(250),
    "price" decimal(10, 2) NOT NULL,
    "category_id" bigint,
    "create_at" timestamp,
    "update_at" timestamp,
    CONSTRAINT product_pkey PRIMARY KEY (id),
    CONSTRAINT product_vendor_code_key UNIQUE (vendor_code),
    FOREIGN KEY (category_id) REFERENCES category
);

CREATE TABLE IF NOT EXISTS "products_images" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "product_id" bigint,
    "path" varchar(255) NOT NULL,
    CONSTRAINT product_images_pkey PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product
);