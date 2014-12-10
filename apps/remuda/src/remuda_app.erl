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
%%% @doc Remuda's application behaviour callbacks.
%%% @end
%%% ==========================================================================

-module(remuda_app).

-author('Sebastien Merle').

-behaviour(application).


%%% ==========================================================================
%%% Exports
%%% ==========================================================================

%%% Behaviour application callbacks
-export([start/2, stop/1]).


%%% ==========================================================================
%%% Behaviour application Callbacks
%%% ==========================================================================

start(_StartType, _StartArgs) ->
    remuda_sup:start_link().


stop(_State) ->
    ok.
