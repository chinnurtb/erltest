
-module(caapp_main).

-behaviour(gen_server).

-export([start_link/1, stop/0]).
-export([user_add/2, user_del/1, user_get/1]).
-export([hostname/0]).
-export([init/1, handle_call/3]).

%export client functions
%operation & maintenace api

start_link(Filename) ->
	gen_server:start_link({local, ?MODULE}, ?MODULE, Filename, []).

stop() ->
	gen_server:cast(?MODULE, stop).

%customer service api
hostname() ->
	node().

user_add(Name, QQ) ->
	gen_server:call(?MODULE, {user_add, Name, QQ}).

user_del(User_id) ->
	gen_server:call(?MODULE, {user_del, User_id}).

user_get(User_id) ->
	gen_server:call(?MODULE, {user_get, User_id}).

%callback api
init(Filename) ->
	{ok, null}.

handle_call({user_add, Name, QQ}, _From, LoopData) ->
	{reply, 1, LoopData};

handle_call({user_del, User_id}, _From, LoopData) ->
	{reply, null, LoopData};

handle_call({user_get, User_id}, _From, LoopData) ->
	{reply, user, LoopData}.
