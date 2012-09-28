
-module(cmapp_main).

-behaviour(gen_server).

-export([start_link/0, stop/0]).
-export([user_add/2, user_del/1, user_get/1]).
-export([agent_get/0]).
-export([init/1, handle_call/3]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).


%export client functions
%operation & maintenace api

start_link() ->
	io:format('filename is ~p ~n.', [filename]),
	gen_server:start_link({local, ?MODULE}, ?MODULE, filename, []).

stop() ->
	gen_server:cast(?MODULE, stop).
%customer service api

user_add(Name, QQ) ->
	gen_server:call(?MODULE, {user_add, Name, QQ}).

user_del(User_id) ->
	gen_server:call(?MODULE, {user_del, User_id}).

user_get(User_id) ->
	gen_server:call(?MODULE, {user_get, User_id}).

%service api
agent_get() ->
	agent_one.

%callback api
init(Filename) ->
	io:format('filename ~p ~n', [Filename]),
	{ok, null}.

handle_call({user_add, Name, QQ}, _From, LoopData) ->
	{reply, 1, LoopData};

handle_call({user_del, User_id}, _From, LoopData) ->
	{reply, null, LoopData};

handle_call({user_get, User_id}, _From, LoopData) ->
	{reply, user, LoopData}.
