CREATE INDEX IF NOT EXISTS ix_orders_status_created_at
    ON orders (status, created_at)
    INCLUDE (customer_id, total_cents);

ANALYZE orders;

EXPLAIN (ANALYZE, BUFFERS)
SELECT id, customer_id, status, created_at, total_cents
FROM orders
WHERE status = 'paid'
  AND created_at >= TIMESTAMPTZ '2025-02-01 00:00:00+00'
  AND created_at < TIMESTAMPTZ '2025-02-02 00:00:00+00';
