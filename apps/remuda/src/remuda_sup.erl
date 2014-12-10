%%% ==========================================================================
%%% Copyright (c) 2014 Sebastien Merle <s.merle@gmail.com>
%%%
%%% This file is part of remuda project: https://github.com/sylane/remuda
%%%
%%% This Source Code Form is subject to the terms of the Mozilla Public
%%% License, v. 2.0. If a copy of the MPL was not distributed with this
%%% file, You can obtain one at http://mozilla.org/MPL/2.0/.
%%% ==========================================================================
%%% @copyright 2014 Sebastien Merle <s.merle@gmail.com>
%%% @author Sebastien Merle <s.merle@gmail.com>
%%% @doc Remuda's root supervisor callback module.
%%% @end
%%% ==========================================================================

-module(remuda_sup).

-author('Sebastien Merle').

-behaviour(supervisor).


%%% ==========================================================================
%%% Exports
%%% ==========================================================================

%%% Process control functions
-export([start_link/0]).

%%% Behaviour supervisor callbacks
-export([init/1]).


%%% ==========================================================================
%%% Macros
%%% ==========================================================================

-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).


%%% ==========================================================================
%%% Process Control Functions
%%% ==========================================================================

%% -----------------------------------------------------------------
%% @doc Starts and links remuda's root supervisor.
%% @end
%% -----------------------------------------------------------------

-spec start_link() -> {ok, Pid} | {error, Reason}
    when Pid :: pid(), Reason :: term().

start_link() ->
    supervisor:start_link(?MODULE, []).


%%% ==========================================================================
%%% Behaviour supervisor Callbacks
%%% ==========================================================================

init([]) ->
    {ok, {{one_for_one, 5, 10}, []}}.

