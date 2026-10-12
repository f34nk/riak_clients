# openriak_erl

Erlang HTTP client for OpenRiak, generated from the OpenRiak Smithy model.

```erlang
{deps, [
    {openriak_erl, "0.1.4"}
]}.
```

```erlang
Config = #{base_url => "http://127.0.0.1:8098"},
{ok, _Output} = openriak_client:ping(Config, #{}).
```

Operation functions take a config map and an input map or record. See `openriak_client` and `openriak_types.hrl` for the full API.
