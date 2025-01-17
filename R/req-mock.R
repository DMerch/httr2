#' Temporarily mock requests
#'
#' Mocking allows you to selectively and temporarily replace the response
#' you would typically receive from a request with your own code. It's
#' primarily used for testing.
#'
#' @param mock A single argument function called with a request object.
#'   It should return either `NULL` (if it doesn't want to handle the request)
#'   or a [response] (if it does).
#' @param code Code to execute in the temporary environment.
#' @param env Environment to use for scoping changes.
#' @returns `with_mock()` returns the result of evaluating `code`.
#' @export
#' @examples
#' # This function should perform a response against google.com:
#' google <- function() {
#'   request("http://google.com") %>%
#'     req_perform()
#' }
#'
#' # But I can use a mock to instead return my own made up response:
#' my_mock <- function(req) {
#'   response(status_code = 403)
#' }
#' with_mock(my_mock, google())
with_mock <- function(mock, code) {
  withr::with_options(list(httr2_mock = mock), code)
}

#' @export
#' @rdname with_mock
local_mock <- function(mock, env = caller_env()) {
  withr::local_options(httr2_mock = mock, .local_envir = env)
}
