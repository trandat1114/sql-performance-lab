# SQL Performance Lab

Reproducible SQL investigations using a local PostgreSQL container.

The scripts model an order lookup workload and compare a non-sargable predicate with an index-friendly range predicate. They intentionally contain no published timing results: hardware, PostgreSQL version, data volume, cache state, and concurrent activity all affect measurements.

## Run locally

```bash
docker compose up -d
docker compose exec postgres psql -U lab -d performance_lab -f /workspace/sql/01-schema.sql
docker compose exec postgres psql -U lab -d performance_lab -f /workspace/sql/02-baseline.sql
docker compose exec postgres psql -U lab -d performance_lab -f /workspace/sql/03-indexed.sql
```

Read [the measurement guide](docs/measurement-guide.md) before interpreting an execution plan.

## Scope

- schema and deterministic sample data
- `EXPLAIN (ANALYZE, BUFFERS)` workflow
- index design trade-offs

This is a lab, not an endorsement of one index for every system.

## Related

- [engineering-playground](https://github.com/trandat1114/engineering-playground)
- [dream-architecture](https://github.com/trandat1114/dream-architecture)
