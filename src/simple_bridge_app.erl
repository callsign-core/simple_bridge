% vim: ts=4 sw=4 et
-module(simple_bridge_app).
-behaviour(application).
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    simple_bridge:start().

stop(_State) ->
		case simple_bridge_util:get_ssl_enable(cowboy) of
			true -> cowboy:stop_listener(https);
			false -> void
		end,
    ok.
