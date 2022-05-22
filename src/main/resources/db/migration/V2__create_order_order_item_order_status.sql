CREATE TABLE IF NOT EXISTS "order_status" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "title" varchar(20) NOT NULL,
    CONSTRAINT "order_status_pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS "order" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "user_id" bigint,
    "status_id" bigint,
    "price" decimal(10, 2) NOT NULL,
    "delivery_price" decimal(10, 2) NOT NULL,
    "delivery_address_id" bigint,
    "phone_number" varchar(10) NOT NULL,
    "delivery_date" timestamp,
    "create_at" timestamp,
    "update_at" timestamp,
    CONSTRAINT "order_pkey" PRIMARY KEY (id),
    FOREIGN KEY (status_id) REFERENCES order_status
);

CREATE TABLE IF NOT EXISTS "order_item" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "quantity" bigint,
    "item_price" decimal(10, 2) NOT NULL,
    "total_price" decimal(10, 2) NOT NULL,
    "product_id" bigint,
    "order_id" bigint,
    CONSTRAINT "order_item_pkey" PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product,
    FOREIGN KEY (order_id) REFERENCES "order"
);