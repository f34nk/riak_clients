FROM erlang:28-alpine

WORKDIR /app

RUN apk add --no-cache git

COPY target/erlang /deps/openriak_erl
COPY service/erlang-demo/rebar.config .
COPY service/erlang-demo/src src

RUN mkdir -p _checkouts \
    && ln -sfn /deps/openriak_erl _checkouts/openriak_erl \
    && rebar3 compile

CMD ["sh", "-c", "erl -noshell -pa $(rebar3 path) -eval 'case application:ensure_all_started(demo) of {ok, _} -> halt(0); {error, Reason} -> io:format(\"~p~n\", [Reason]), halt(1) end.'"]
