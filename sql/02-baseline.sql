-- This expression applies a function to the indexed candidate column.
-- Capture the plan; do not compare elapsed time across different environments.
EXPLAIN (ANALYZE, BUFFERS)
SELECT id, customer_id, status, created_at, total_cents
FROM orders
WHERE DATE(created_at AT TIME ZONE 'UTC') = DATE '2025-02-01'
  AND status = 'paid';
