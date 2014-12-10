.PHONY: remuda deps update clean distclean doc install ct test dialyze xref \
        release quick-release
RELNAME=remuda
ERLANG_VER=$(shell erl -noinput -eval 'io:format("~s",[erlang:system_info(otp_release)]), halt().')
DIALYZER_PLT = $(HOME)/.dialyzer.$(ERLANG_VER).plt
DIALYZER_WARNINGS = -Wunmatched_returns -Werror_handling -Wrace_conditions
DIALYZER_APPS = kernel stdlib sasl erts ssl tools os_mon runtime_tools crypto \
                inets xmerl webtool snmp public_key mnesia eunit common_test \
                syntax_tools compiler
REBAR_CONFIG = $(PWD)/rebar.config

ifneq (, $(wildcard ./rebar))
    REBAR = $(PWD)/rebar -C $(REBAR_CONFIG)
else 
    REBAR = rebar -C $(REBAR_CONFIG)
endif

all: remuda

remuda: deps
	@rm -rf ./ebin || true
	@$(REBAR) compile

ct: remuda
	@$(REBAR) ct skip_deps=true

test: ct

deps:
	@$(REBAR) get-deps

update:
	@$(REBAR) update-deps

clean:
	@$(REBAR) clean || true
	@rm -rf rel/$(RELNAME) || true

distclean: clean
	@rm -f doc/*.html doc/edoc-info
	@rm -rf deps

dialyze: remuda $(DIALYZER_PLT)
	@dialyzer --plt $(DIALYZER_PLT) $(DIALYZER_WARNINGS) apps/remuda/ebin

$(DIALYZER_PLT):
	@dialyzer --build_plt --output_plt $(DIALYZER_PLT) --apps $(DIALYZER_APPS)

xref: remuda
	@$(REBAR) xref skip_deps=true

release: clean remuda xref dialyze test quick-release

quick-release: remuda
	@rm -rf rel/$(RELNAME) || true
	@$(REBAR) generate

doc: remuda
	@$(REBAR) doc skip_deps=true
