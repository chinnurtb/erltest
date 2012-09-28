-module(cmapp_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
	case _StartType of 
		normal ->
			io:format('start normal ~n');
		{failover, _Node} ->
			io:format('failover ~p ~n', [_Node]);
		{takeover, _Node} ->
			io:format('takeover ~p ~n', [_Node])
	end,
    cmapp_sup:start_link().

stop(_State) ->
    ok.
