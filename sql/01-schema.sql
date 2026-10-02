DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    id BIGSERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('pending', 'paid', 'cancelled')),
    created_at TIMESTAMPTZ NOT NULL,
    total_cents INTEGER NOT NULL CHECK (total_cents >= 0)
);

INSERT INTO orders (customer_id, status, created_at, total_cents)
SELECT
    (series % 5000) + 1,
    (ARRAY['pending', 'paid', 'cancelled'])[(series % 3) + 1],
    TIMESTAMPTZ '2025-01-01 00:00:00+00' + (series * INTERVAL '1 minute'),
    1000 + (series % 10000)
FROM generate_series(1, 100000) AS series;

ANALYZE orders;
