# httr2 (development version)

* `response()` now defaults `body` to `raw(0)` for consistency with real
  responses (#100).

* `httr_path` class renamed to `httr2_path` to correctly match package name 
  (#99).

* Added PKCE support to `oauth_flow_device()` (@flahn, #92).

# httr2 0.1.1

* Fix R CMD check failures on CRAN

* Added a `NEWS.md` file to track changes to the package.