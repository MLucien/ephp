-module(ephp_lib_error).
-author('manuel@altenwald.com').
-compile([warnings_as_errors]).

-behaviour(ephp_func).

-export([
    init_func/0,
    init_config/0,
    init_const/0,

    error_reporting/3
]).

-include("ephp.hrl").

-spec init_func() -> ephp_func:php_function_results().

init_func() -> [
    error_reporting
].

-spec init_config() -> ephp_func:php_config_results().

init_config() -> [].

-spec init_const() -> ephp_func:php_const_results().

init_const() -> [
    {<<"E_ERROR">>, ?E_ERROR},
    {<<"E_WARNING">>, ?E_WARNING},
    {<<"E_PARSE">>, ?E_PARSE},
    {<<"E_NOTICE">>, ?E_NOTICE},
    {<<"E_CORE_ERROR">>, ?E_CORE_ERROR},
    {<<"E_CORE_WARNING">>, ?E_CORE_WARNING},
    {<<"E_COMPILE_ERROR">>, ?E_COMPILE_ERROR},
    {<<"E_COMPILE_WARNING">>, ?E_COMPILE_WARNING},
    {<<"E_USER_ERROR">>, ?E_USER_ERROR},
    {<<"E_USER_WARNING">>, ?E_USER_WARNING},
    {<<"E_USER_NOTICE">>, ?E_USER_NOTICE},
    {<<"E_STRICT">>, ?E_STRICT},
    {<<"E_RECOVERABLE_ERROR">>, ?E_RECOVERABLE_ERROR},
    {<<"E_DEPRECATED">>, ?E_DEPRECATED},
    {<<"E_USER_DEPRECATED">>, ?E_USER_DEPRECATED},
    {<<"E_ALL">>, ?E_ALL}
].

-spec error_reporting(context(), line(), var_value()) -> integer().

error_reporting(Context, _Line, {_, ErrorLevel}) when is_integer(ErrorLevel) ->
    ephp_error:error_reporting(Context, ErrorLevel).
