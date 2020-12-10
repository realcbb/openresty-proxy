-- check Proxy-Authorization for https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/407
if not ngx.var.http_proxy_authorization then
    -- ngx.header["Proxy-Authenticate"] = "Basic realm=\"Access to internal site\""
    ngx.exit(404)
end

ngx.log(ngx.DEBUG, ngx.req.raw_header())

-- transfer Proxy-Authorization header to Authorization for auth basic module
ngx.req.set_header("Authorization", ngx.var.http_proxy_authorization)
ngx.req.set_header("Connection", ngx.var.http_proxy_connection)
