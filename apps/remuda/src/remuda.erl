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
%%% @doc Remuda's API module.
%%% @end
%%% ==========================================================================

-module(remuda).

-author('Sebastien Merle').


%%% ==========================================================================
%%% Includes
%%% ==========================================================================

-include("remuda_internal.hrl").


%%% ==========================================================================
%%% Exports
%%% ==========================================================================

%%% API functions
-export([start/0,
		 stop/0]).


%%% ==========================================================================
%%% API Functions
%%% ==========================================================================

%% -----------------------------------------------------------------
%% @doc Starts the application.
%% @end
%% -----------------------------------------------------------------

-spec start() -> {ok, Pid} | {error, Reason}
	when Pid :: pid(), Reason :: term().

start() ->
	{ok, AppName} = application:get_application(?MODULE),
    application:start(AppName).


%% -----------------------------------------------------------------
%% @doc Stops the application.
%% @end
%% -----------------------------------------------------------------

-spec stop() -> {ok, Pid} | {error, Reason}
	when Pid :: pid(), Reason :: term().

stop() ->
	{ok, AppName} = application:get_application(?MODULE),
    application:stop(AppName).
