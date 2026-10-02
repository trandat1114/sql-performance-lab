# Measurement guide

1. Record PostgreSQL version, machine details, container limits, data volume, and whether the cache was warm.
2. Run each query more than once, keeping the schema and concurrent workload stable.
3. Compare plan shape, actual rows versus estimates, buffer reads, and planning time; do not use one elapsed-time value as a universal conclusion.
4. Explain the write cost and storage cost of every proposed index.
5. Save the query, parameters, plan, and environment together if publishing a result.

The goal is to learn how a particular query behaves in a stated environment, not to claim that one technique is always faster.
